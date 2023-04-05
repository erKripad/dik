//----------------------------------------------------------------------------//

import 'package:dik/Theme/Drawer/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dik/Theme/Main%20Interface/calendar_screen.dart';
import 'package:dik/Theme/Main%20Interface/map_screen.dart';
import 'package:dik/Theme/Main%20Interface/search_screen.dart';
import 'package:dik/Theme/Main Interface/home_screen.dart';

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
    const CalendarScreen(),
    const MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            toolbarHeight: 55,
            elevation: 50,
            backgroundColor: Colors.black,
            title: const Text(
              "Dik",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: "Lobster",
                height: 0.75,
                fontSize: 30,
              ),
            ),
            actions: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
                elevation: 3,
                backgroundColor: Colors.transparent,
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
        body: _children[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 38,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        //selectedItemColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 50,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              LineAwesomeIcons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(
              LineAwesomeIcons.search,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Calendario',
            icon: Icon(
              LineAwesomeIcons.calendar_with_week_focus,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Map',
            icon: Icon(
              LineAwesomeIcons.map_marked,
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
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 49, 46, 46),
        child: ProfileScreen(),
      ),
    );
  }
}

//----------------------------------------------------------------------------//