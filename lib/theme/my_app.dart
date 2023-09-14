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
import 'package:dik/Theme/icons.dart';
import 'package:dik/Theme/App/Profile/Profile Pages/add_event_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

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
        '/profile': (context) => const ProfilePage(),
        '/cart': (context) => const CartPage(),
        '/privacy': (context) => const PrivacyPage(),
        '/info': (context) => const InfoPage(),
        '/tickets': (context) => const TicketsPage(),
        '/new_page': (context) => const SelectedPage(),
        '/edit_profile_picture': (context) => const ProfilePictureEditingPage(),
        '/new_category_page': (context) => const CategoryPage(
              category: "disco",
              categoryIcon: CustomIcons.disco,
            ),
        '/add_event': (context) => const AddEventPage(),
      },
    );
  }
}

//----------------------------------------------------------------------------//
