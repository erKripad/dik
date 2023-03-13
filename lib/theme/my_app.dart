//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
//                                                                            //
//                            ___      _ _                                    //
//                           / _ \__ _| | | ___                               //
//                          / /_)/ _` | | |/ _ \                              //
//                         / ___/ (_| | | |  __/                              //
//                         \/    \__,_|_|_|\___|                              //
//                                                                            //
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

/* in questa sezione vengono importati tutti i pacchetti di Dart cioè le 
   estensioni per rendere magico Flutter */

import 'package:flutter/material.dart';
import 'package:dik/theme/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

//----------------------------------------------------------------------------//

/* in questa sezione viene creata e gestita l'applicazione appena lanciata*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "Dik Demo";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: "Roboto",

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          bodyLarge: TextStyle(fontFamily: "Lobster"),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

//----------------------------------------------------------------------------//