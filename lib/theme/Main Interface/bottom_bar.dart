//----------------------------------------------------------------------------//

import 'package:dik/Theme/Drawer/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dik/Theme/Main%20Interface/calendar_screen.dart';
import 'package:dik/Theme/Main%20Interface/map_screen.dart';
import 'package:dik/Theme/Main%20Interface/search_screen.dart';
import 'package:dik/Theme/Main Interface/home_screen.dart';
import 'package:dik/Theme/Main Interface/saved_screen.dart';

//----------------------------------------------------------------------------//

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

//----------------------------------------------------------------------------//

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 0;
  var background_color = const Color.fromARGB(255, 25, 24, 28);
  var color_purple = const Color.fromARGB(255, 165, 126, 255);
  final List<Widget> _children = [
    const HomeScreen(),
    const SearchScreen(),
    const SavedScreen(),
    const MapScreen(),
    const CalendarScreen(),
  ];
  final List<String> title = [
    "Eventi",
    "SearchPage",
    "Saved",
    "Map",
    "Calendar",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 55,
        elevation: 0,
        backgroundColor: background_color,
        bottomOpacity: 1,
        title: Text(
          title[currentIndex],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: const Icon(
                  Icons.notifications_none,
                  size: 35,
                  color: Colors.white,
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
            ]),
          ),
        ],
      ),
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 38,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 25, 24, 28),
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
            label: 'BookMark',
            icon: Icon(
              LineAwesomeIcons.bookmark,
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
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}

//----------------------------------------------------------------------------//