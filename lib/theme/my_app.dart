//----------------------------------------------------------------------------//

// in questa sezione vengono importati tutti i pacchetti di Dart cioè le estensioni per rendere magico Flutter

import 'package:dik/Theme/Main%20Interface/Profile/profile_page.dart';
import 'package:dik/theme/Main%20Interface/Screens/Home%20Page/selected_page.dart';
import 'package:flutter/material.dart';
import 'package:dik/Theme/Main%20Interface/Profile/Profile%20Pages/settings_page.dart';
import 'package:dik/Theme/Main%20Interface/notifications_page.dart';
import 'package:dik/Theme/Main%20Interface/bottom_bar.dart';
import 'package:dik/Theme/Main%20Interface/Profile/Profile%20Pages/cart_page.dart';
import 'package:dik/Theme/Main%20Interface/Profile/Profile%20Pages/info_page.dart';
import 'package:dik/Theme/Main%20Interface/Profile/Profile%20Pages/privacy_page.dart';
import 'package:dik/Theme/Main%20Interface/Profile/Profile%20Pages/tickets_page.dart';
import 'package:dik/Theme/Main%20Interface/Profile/profile_picture_editing_page.dart';

//----------------------------------------------------------------------------//

// in questa sezione viene creata e gestita l'applicazione appena lanciata

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Gelion Bold",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyBottomNavigationBar(),
        '/settings': (context) => const SettingsPage(),
        '/notifications': (context) => const NotificationScreen(),
        '/profile': (context) => const ProfilePage(),
        '/cart': (context) => const CartPage(),
        '/privacy': (context) => const PrivacyPage(),
        '/info': (context) => const InfoPage(),
        '/tickets': (context) => const TicketsPage(),
        '/new_page': (context) => const SelectedPage(
            //setColor: setColor,
            //color: color,
            ),
        '/edit_profile_picture': (context) => ProfilePictureEditingPage(),
      },
    );
  }
}

//----------------------------------------------------------------------------//