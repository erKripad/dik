//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/App/Screens/calendar_screen.dart';
import 'package:dik/Theme/App/Screens/map_screen.dart';
import 'package:dik/Theme/App/Screens/search_screen.dart';
import 'package:dik/Theme/App/Screens/HomePage/home_screen.dart';
import 'package:dik/Theme/App/Screens/saved_screen.dart';
import 'package:dik/Theme/colors.dart';
import 'package:dik/theme/App/appbar.dart';
import 'package:dik/theme/App/bottombar.dart';
import 'package:dik/theme/icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
        iconColor: iconColor,
        iconSize: screenheight * 4.5 / 100,
        backgroundColor: primaryBackgroundColor,
        selectedColor: primaryPurple,
        items: [
          BottomBarItem(
            importedIconAVG: true,
            customIcon: CustomIcons.home,
          ),
          BottomBarItem(
            importedIconAVG: false,
            iconData: LineAwesomeIcons.search,
          ),
          BottomBarItem(
            importedIconAVG: false,
            iconData: LineAwesomeIcons.heart,
          ),
          BottomBarItem(
            importedIconAVG: false,
            iconData: LineAwesomeIcons.map_marked,
          ),
          BottomBarItem(
            importedIconAVG: true,
            customIcon: CustomIcons.empty_calendar,
          ),
        ],
        onTabSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
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