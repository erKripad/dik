//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// colors
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "3",
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