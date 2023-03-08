//----------------------------------------------------------------------------//

import 'package:dik/theme/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dik/theme/notificattion_page.dart';

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
          //style: GoogleFonts.lobster(),
          textAlign: TextAlign.right,
        ),
        actions: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            tooltip: 'Notifiche',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[],
        ),
      ),
      //
      bottomNavigationBar: ConvexAppBar(
        curveSize: 80,
        elevation: 50,
        items: const [
          TabItem(icon: Icons.map, title: 'Map'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        color: Colors.white,
        backgroundColor: Colors.black,
        height: 55,
      ),
      //
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      //
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.all(8),
          children: [
            const DrawerHeader(
              margin: EdgeInsets.only(top: 75.0, bottom: 15),
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                //backgroundImage: AssetImage("assets/1.5x/papera.png"),
              ),
            ),
            ListTile(
              title: const Text(
                'Item 1',
                style: TextStyle(color: Colors.white),
              ),
              iconColor: Colors.white,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Item 2',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      //
    );
  }
}

//----------------------------------------------------------------------------//