//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/Main%20Interface/Screens/calendar_screen.dart';
import 'package:dik/Theme/Main%20Interface/Screens/map_screen.dart';
import 'package:dik/Theme/Main%20Interface/Screens/search_screen.dart';
import 'package:dik/Theme/Main Interface/Screens/Home Page/home_screen.dart';
import 'package:dik/Theme/Main Interface/Screens/saved_screen.dart';
import 'package:dik/Theme/colors.dart';
import 'package:dik/theme/Main Interface/appbar.dart';
import 'package:dik/theme/Main Interface/bottombar.dart';

//----------------------------------------------------------------------------//

class MainInterface extends StatefulWidget {
  const MainInterface({
    super.key,
  });

  @override
  State<MainInterface> createState() => _MainInterfaceState();
}

class _MainInterfaceState extends State<MainInterface> {
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
    "Tonight",
    "",
    "Salvati",
    "Mappe",
    "Calendario",
  ];
  // l'applicazione si avvia dal primo elemento della lista
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //prendo le misure dello schermo
    double screenheight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: MyAppBar(
          title: title[currentIndex],
          notifications: true,
          profile: true,
        ),
      ),
      body: _children[currentIndex],
      bottomNavigationBar: MyBottomBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index!;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {});
            });
          }),
    );
  }
}

/*(index) {
            if (mounted) {
              setState(() {
                currentIndex = index!;
              });
            }
          }
          
          
          
          
          
            @override
  void initState() {
    changeIndex(currentIndex);
    super.initState();
  }

  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }*/