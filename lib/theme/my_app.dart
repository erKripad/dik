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

import 'package:dik/Theme/Profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:dik/Theme/Profile/Profile%20Pages/settings_page.dart';
import 'package:dik/Theme/Profile/profile_editing_page.dart';
import 'package:dik/Theme/Main%20Interface/notifications_page.dart';
import 'package:dik/Theme/Main%20Interface/bottom_bar.dart';
import 'package:dik/Theme/Profile/Profile%20Pages/cart_page.dart';
import 'package:dik/Theme/Profile/Profile%20Pages/info_page.dart';
import 'package:dik/Theme/Profile/Profile%20Pages/privacy_page.dart';
import 'package:dik/Theme/Profile/Profile%20Pages/tickets_page.dart';

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
        '/edit_profile': (context) => const ProfileEditingScreen(),
        '/profile': (context) => const ProfilePage(),
        '/cart': (context) => const CartPage(),
        '/privacy': (context) => const PrivacyPage(),
        '/info': (context) => const InfoPage(),
        '/tickets': (context) => const TicketsPage(),
      },
    );
  }
}

//----------------------------------------------------------------------------//