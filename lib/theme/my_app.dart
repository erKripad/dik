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

//----------------------------------------------------------------------------//

/* in questa sezione viene creata e gestita l'applicazione appena lanciata*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "Dik Demo";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: HomeScreen(),
    );
  }
}

//----------------------------------------------------------------------------//