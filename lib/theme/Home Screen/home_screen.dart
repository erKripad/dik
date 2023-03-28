//----------------------------------------------------------------------------//

import 'package:dik/Theme/Home%20Screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dik/Theme/Home Screen/calendar_screen.dart';
import 'package:dik/Theme/Home Screen/map_screen.dart';
import 'package:dik/Theme/Home Screen/search_screen.dart';

//----------------------------------------------------------------------------//

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyStatefulWidgetState();
}

//----------------------------------------------------------------------------//

class _MyStatefulWidgetState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            transform: GradientRotation(4),
            colors: [
              Color.fromARGB(255, 140, 15, 161),
              Colors.deepOrangeAccent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          primary: false,
          /*crossAxisCount: 1,
          mainAxisSpacing: 0,
          crossAxisSpacing: 10,*/
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlurryContainer(
                color: Colors.black.withOpacity(0.7),
                blur: 8,
                elevation: 6,
                height: 240,
                padding: const EdgeInsets.all(32),
                child: Column(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlurryContainer(
                color: Colors.black.withOpacity(0.7),
                blur: 8,
                elevation: 6,
                height: 240,
                padding: const EdgeInsets.all(32),
                child: Column(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlurryContainer(
                color: Colors.black.withOpacity(0.7),
                blur: 8,
                elevation: 6,
                height: 240,
                padding: const EdgeInsets.all(32),
                child: Column(),
              ),
            ),
          ],
        ),
      ),
      //
    );
  }
}

//----------------------------------------------------------------------------//

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const SearchScreen(),
    const MapScreen(),
    const CalendarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      //
      //
      //
      appBar: AppBar(
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
      //
      //
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 0,
        elevation: 50,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              LineAwesomeIcons.home,
              color: Colors.white,
              size: 40,
            ),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(
              LineAwesomeIcons.search,
              color: Colors.white,
              size: 40,
            ),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: 'Calendario',
            icon: Icon(
              LineAwesomeIcons.calendar_with_week_focus,
              color: Colors.white,
              size: 40,
            ),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            label: 'Map',
            icon: Icon(
              LineAwesomeIcons.map_marked,
              color: Colors.white,
              size: 40,
            ),
            backgroundColor: Colors.black,
          ),
        ],
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 17,
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
        backgroundColor: Colors.black,
        child: ProfileScreen(),
      ),
    );
  }
}
