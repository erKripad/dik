//----------------------------------------------------------------------------//

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dik/theme/colors.dart';

//----------------------------------------------------------------------------//

class NewEventPage extends StatelessWidget {
  const NewEventPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Crea Evento",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 25,
            color: textColor,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: primaryBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

//----------------------------------------------------------------------------//