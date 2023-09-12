//----------------------------------------------------------------------------//

// framework

import 'package:dik/Theme/App/Widgets/text2.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:dik/theme/App/Widgets/appbar.dart';
import 'package:dik/Theme/App/Widgets/title2.dart';

// colors
import 'package:dik/theme/colors.dart';

// firebase
import 'package:cloud_firestore/cloud_firestore.dart';

//----------------------------------------------------------------------------//

class AddEventPage extends StatelessWidget {
  const AddEventPage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: const MyAppBar(
          gobackbutton: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenwidth * 4 / 100),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        child: Column(
          children: [
            const Title2(
              title: "Add Event Page",
            ),
            SizedBox(
              height: screenheight * 5 / 100,
            ),
            const Text2(title: "Nome"),
            SizedBox(
              height: screenheight * 2 / 100,
            ),
            const AddContainer(),
          ],
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: primaryBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

class AddContainer extends StatefulWidget {
  const AddContainer({super.key});

  @override
  State<AddContainer> createState() => AddContainerState();
}

class AddContainerState extends State<AddContainer> {
  final controller = TextEditingController();

  @override
  Widget build(context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: primaryObjColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.all(screenwidth * 1 / 100),
      height: screenheight * 10 / 100,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: TextField(
            controller: controller,
          ),
        ),
        SizedBox(height: screenheight * 4 / 100),
        IconButton(
            onPressed: () {
              final name = controller.text;
              createUser(name: name);
            },
            icon: const Icon(Icons.add)),
      ]),
    );
  }

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = {
      'name': name,
      'age': 21,
      'birthday': DateTime(2001, 7, 28),
    };

    await docUser.set(json);
  }
}

//----------------------------------------------------------------------------//