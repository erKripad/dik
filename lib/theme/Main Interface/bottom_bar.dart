//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dik/Theme/Main%20Interface/calendar_screen.dart';
import 'package:dik/Theme/Main%20Interface/map_screen.dart';
import 'package:dik/Theme/Main%20Interface/search_screen.dart';
import 'package:dik/Theme/Main Interface/home_screen.dart';
import 'package:dik/Theme/Main Interface/saved_screen.dart';
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

//----------------------------------------------------------------------------//

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const SearchScreen(),
    const SavedScreen(),
    const MapScreen(),
    const CalendarScreen(),
  ];
  final List<String> title = [
    "Eventi",
    "Cerca",
    "Salvati",
    "Mappe",
    "Calendario",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 55,
        elevation: 0,
        backgroundColor: primaryBackgroundColour,
        bottomOpacity: 1,
        title: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              title[currentIndex],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Gelion Bold",
                fontSize: 30,
                color: textColour,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Icon(
                  LineAwesomeIcons.bell,
                  size: 35,
                  color: iconColour,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                        image: AssetImage("assets/immagine di profilo.jpg")),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ]),
          ),
        ],
      ),
      body: _children[currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            iconSize: 35,
            selectedIconTheme: IconThemeData(
              color: iconColour,
              size: 38,
            ),
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryBackgroundColour,
            //selectedItemColor: Colors.white,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            elevation: 50,
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
            //selectedItemColor: Colors.red,

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