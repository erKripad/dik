//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class ProfilePictureEditingPage extends StatefulWidget {
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