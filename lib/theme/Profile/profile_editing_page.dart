//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class ProfileEditingScreen extends StatelessWidget {
  const ProfileEditingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 55,
        elevation: 0,
        backgroundColor: primaryBackgroundColour,
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: primaryBackgroundColour,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                        image: AssetImage("assets/immagine di profilo.jpg")),
                  ),
                ),
                Center(
                  child: Text(
                    "Modifica Profilo",
                    style: TextStyle(
                      fontFamily: "Gelion Bold",
                      fontSize: 25,
                      color: textColour,
                    ),
                    //textAlign: TextAlign.center
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//