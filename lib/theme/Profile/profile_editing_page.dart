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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Modifica Profilo",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 25,
            color: textColour,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: primaryBackgroundColour,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

//----------------------------------------------------------------------------//