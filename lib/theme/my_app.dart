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
import 'package:dik/Theme/Home Screen/home_screen.dart';
import 'package:dik/Theme/Home Screen/settings_page.dart';
import 'package:dik/Theme/Home Screen/profile_editing_page.dart';
import 'package:dik/Theme/Home Screen/notificattion_page.dart';

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
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: "Roboto",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyBottomNavigationBar(),
        '/settings': (context) => const SettingsPage(),
        '/notifications': (context) => const NotificationScreen(),
        '/edite_profile': (context) => const ProfileEditingScreen(),
      },
    );
  }
}

//----------------------------------------------------------------------------//