//----------------------------------------------------------------------------//

// pagina dedicata esclusivamente dalle notifiche in-app

// è composta da una serie di container (eliminabili) contenenti il messaggio della notifica

//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: primaryBackgroundColour,
        title: Text(
          "Notifiche",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 25,
            color: textColour,
          ),
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: primaryBackgroundColour,
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
            decoration: BoxDecoration(
              color: primaryObjColour,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//