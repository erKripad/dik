//----------------------------------------------------------------------------//

// pagina dedicata esclusivamente dalle notifiche in-app

// è composta da una serie di container (eliminabili) contenenti il messaggio della notifica

//----------------------------------------------------------------------------//

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:dik/theme/Main Interface/appbar.dart';

//----------------------------------------------------------------------------//

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
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
      extendBodyBehindAppBar: false,
      backgroundColor: primaryBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: const NotificationItem(),
    );
  }
}

//----------------------------------------------------------------------------//

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: AspectRatio(
        aspectRatio: 100 / 30,
        child: GestureDetector(
          onTap: () {
            //Navigator.pushNamed();
          },
          child: Container(
            decoration: const BoxDecoration(
              color: primaryObjColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//