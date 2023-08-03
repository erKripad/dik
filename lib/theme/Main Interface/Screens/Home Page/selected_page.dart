//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:dik/theme/Main Interface/appbar.dart';

//----------------------------------------------------------------------------//

class SelectedPage extends StatelessWidget {
  const SelectedPage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: const MyAppBar(
          hype: true,
          gobackbutton: true,
        ),
      ),
      backgroundColor: primaryBackgroundColour,
      body:
          // considero un bordo padding standard di 15 come nelle altre schede
          Padding(
        padding: EdgeInsets.all(15),
        // inizio a creare la pagina mettendo in colonna i diversi elementi
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: screenwidth * 50 / 100,
                  width: screenwidth * 50 / 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image(
                        image: AssetImage("assets/papera.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                height: screenheight * 2 / 100,
              ),
              Text(
                "Caccia alle Papere",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: 20,
                  color: primaryPurple,
                ),
              ),
              SizedBox(
                height: screenheight * 2 / 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

//----------------------------------------------------------------------------//
