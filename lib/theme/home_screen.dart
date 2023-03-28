//----------------------------------------------------------------------------//

import 'package:dik/theme/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dik/theme/notificattion_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

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
      bottomNavigationBar: ConvexAppBar(
        curveSize: 80,
        elevation: 50,
        items: const [
          TabItem(icon: LineAwesomeIcons.home, title: 'Home'),
          TabItem(icon: LineAwesomeIcons.search, title: 'Search'),
          TabItem(icon: LineAwesomeIcons.map_marked, title: 'Map'),
        ],
        color: Colors.white,
        backgroundColor: Colors.black,
        height: 55,
      ),
      //
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      //
      drawer: const Drawer(
        backgroundColor: Colors.black,
        child: ProfileScreen(),
      ),
      //
    );
  }
}

//----------------------------------------------------------------------------//