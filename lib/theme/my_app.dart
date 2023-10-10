//----------------------------------------------------------------------------//

// in questa sezione vengono importati tutti i pacchetti di Dart cioè le estensioni per rendere magico Flutter

import 'package:dik/Theme/App/Profile/profile_page.dart';
import 'package:dik/Theme/App/Screens/HomeScreen/category_page.dart';
import 'package:dik/theme/App/Screens/HomeScreen/selected_page.dart';
import 'package:dik/theme/App/main_interface.dart';
import 'package:flutter/material.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/settings_page.dart';
import 'package:dik/Theme/App/Profile/profile_picture_editing_page.dart';
import 'package:dik/Theme/App/Notifications/notifications_page.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/cart_page.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/info_page.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/privacy_page.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/tickets_page.dart';
import 'package:dik/Theme/MaterialsUI/icons.dart';

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
        '/': (context) => const MainInterface(),
        '/settings': (context) => const SettingsPage(),
        '/notifications': (context) => const NotificationScreen(),
        '/profile': (context) => ProfilePage(),
        '/cart': (context) => const CartPage(),
        '/privacy': (context) => const PrivacyPage(),
        '/info': (context) => const InfoPage(),
        '/tickets': (context) => const TicketsPage(),
        '/new_page': (context) => const SelectedPage(),
        '/edit_profile_picture': (context) => const ProfilePictureEditingPage(),
      },
    );
  }
}

//----------------------------------------------------------------------------//