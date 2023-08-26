//----------------------------------------------------------------------------//

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class ProfilePictureEditingPage extends StatefulWidget {
  const ProfilePictureEditingPage({super.key});

  @override
  _ProfilePictureEditingPageState createState() =>
      _ProfilePictureEditingPageState();
}

class _ProfilePictureEditingPageState extends State<ProfilePictureEditingPage> {
  /*var _image = File();
  final picker = ImagePicker();*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 55,
        elevation: 0,
        backgroundColor: primaryBackgroundColor,
        title: const Text(
          "Immagine di profilo",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 25,
            color: textColor,
          ),
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: primaryBackgroundColor,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

      body: const Column(
        children: [
          AspectRatio(
            aspectRatio: 5 / 2,
            child: SizedBox(),
          ),
          Image(
            image: AssetImage("assets/immagine di profilo.jpg"),
          ),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------//