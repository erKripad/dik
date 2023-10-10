//----------------------------------------------------------------------------//

// in questa sezione vengono importati tutti i pacchetti di Dart cioè le estensioni per rendere magico Flutter

import 'package:dik/Theme/App/Profile/profile_page.dart';
import 'package:dik/Theme/App/Screens/HomeScreen/category_page.dart';
import 'package:dik/theme/App/Screens/HomeScreen/selected_page.dart';
import 'package:dik/theme/App/main_interface.dart';
import 'package:flutter/material.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/settings_page.dart';
import 'package:dik/Theme/App/Profile/profile_picture_editing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:dik/Theme/App/Notifications/notifications_page.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/cart_page.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/info_page.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/privacy_page.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/tickets_page.dart';
import 'package:dik/Theme/MaterialsUI/icons.dart';
import 'package:dik/Theme/App/Profile/ProfilePages/add_event_page.dart';

//----------------------------------------------------------------------------//

// * in questa sezione viene creata e gestita l'applicazione appena lanciata

class Tonight extends StatelessWidget {
  const Tonight({super.key});

  @override
  Widget build(BuildContext context) {
    // consente di utilizzare l'app solo con lo schermo verticale
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // creazione della material app
    return MaterialApp(
      // percorso iniziale dove si aprirà l'app
      initialRoute: '/',

      // percorsi standardizzati che possono essere utilizzati con Navigator.pushNamed()
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
        '/add_event': (context) => const AddEventPage(),
      },
    );
  }
}

//----------------------------------------------------------------------------//
