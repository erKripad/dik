//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class ProfilePictureEditingPage extends StatelessWidget {
  const ProfilePictureEditingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 55,
        elevation: 0,
        backgroundColor: primaryBackgroundColour,
        title: Text(
          "Immagine di profilo",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 25,
            color: textColour,
          ),
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: primaryBackgroundColour,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

      body: Container(
        child: Column(
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
      ),
    );
  }
}

//----------------------------------------------------------------------------//