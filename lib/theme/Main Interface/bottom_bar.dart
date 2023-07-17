//----------------------------------------------------------------------------//

// interfaccia principale dell'app, si avvia nella home ed è possibile scorrere tra le diverse opzioni della bottom-bar

//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dik/Theme/Main%20Interface/Screens/calendar_screen.dart';
import 'package:dik/Theme/Main%20Interface/Screens/map_screen.dart';
import 'package:dik/Theme/Main%20Interface/Screens/search_screen.dart';
import 'package:dik/Theme/Main Interface/Screens/Home Page/home_screen.dart';
import 'package:dik/Theme/Main Interface/Screens/saved_screen.dart';
import 'package:dik/Theme/colors.dart';
import 'package:dik/Theme/Main Interface/appbar.dart';

//----------------------------------------------------------------------------//

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

//----------------------------------------------------------------------------//

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  //inizializzo la lista di elementi contenuti nella bottom-nar
  final List<Widget> _children = [
    const HomeScreen(),
    const SearchScreen(),
    const SavedScreen(),
    const MapScreen(),
    const CalendarScreen(),
  ];
  //inizializzo la lista di titoli degli elementi contenuti nella bottom-nar
  final List<String> title = [
    "Eventi",
    "",
    "Salvati",
    "Mappe",
    "Calendario",
  ];
  // l'applicazione si avvia dal primo elemento della lista
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: MyAppBar(
        title: title[currentIndex],
      ),
      body: _children[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: kToolbarHeight + 5,
          child: BottomNavigationBar(
            iconSize: 35,
            selectedIconTheme: IconThemeData(
              color: iconColour,
              size: 38,
            ),
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryBackgroundColour,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  LineAwesomeIcons.home,
                  size: 35,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(
                  LineAwesomeIcons.search,
                  size: 35,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Favorites',
                icon: Icon(
                  LineAwesomeIcons.heart,
                  size: 35,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Map',
                icon: Icon(
                  LineAwesomeIcons.map_marked,
                  size: 35,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Calendario',
                icon: Icon(
                  LineAwesomeIcons.calendar_with_week_focus,
                  size: 35,
                ),
              ),
            ],
            selectedLabelStyle: TextStyle(
              color: textColour,
              fontWeight: FontWeight.bold,
            ),
            currentIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}

//----------------------------------------------------------------------------//