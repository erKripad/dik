//----------------------------------------------------------------------------//

// in questa sezione vengono importati tutti i pacchetti di Dart cioè le estensioni per rendere magico Flutter

import 'package:dik/Theme/App/Profile/profile_page.dart';
import 'package:dik/Theme/App/Screens/HomePage/category_page.dart';
import 'package:dik/theme/App/selected_page.dart';
import 'package:dik/theme/App/main_interface.dart';
import 'package:flutter/material.dart';
import 'package:dik/Theme/App/Profile/Profile%20Pages/settings_page.dart';
import 'package:dik/Theme/App/Profile/profile_picture_editing_page.dart';
import 'package:dik/Theme/App/notifications_page.dart';
import 'package:dik/Theme/App/Profile/Profile%20Pages/cart_page.dart';
import 'package:dik/Theme/App/Profile/Profile%20Pages/info_page.dart';
import 'package:dik/Theme/App/Profile/Profile%20Pages/privacy_page.dart';
import 'package:dik/Theme/App/Profile/Profile%20Pages/tickets_page.dart';
import 'dart:ui';
import 'package:dik/Theme/icons.dart';

//----------------------------------------------------------------------------//

// in questa sezione viene creata e gestita l'applicazione appena lanciata

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Gelion Bold",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainInterface(),
        '/settings': (context) => const SettingsPage(),
        '/notifications': (context) => const NotificationScreen(),
        '/profile': (context) => const ProfilePage(),
        '/cart': (context) => const CartPage(),
        '/privacy': (context) => const PrivacyPage(),
        '/info': (context) => const InfoPage(),
        '/tickets': (context) => const TicketsPage(),
        '/new_page': (context) => const SelectedPage(),
        '/edit_profile_picture': (context) => const ProfilePictureEditingPage(),
        '/new_category_page': (context) => CategoryPage(
              category: "disco",
              categoryIcon: CustomIcons.disco,
            ),
      },
    );
  }
}

//----------------------------------------------------------------------------//