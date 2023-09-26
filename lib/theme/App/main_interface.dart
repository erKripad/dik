//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// widgets
import 'package:dik/theme/Widgets/appbar.dart';
import 'package:dik/theme/Widgets/bottombar.dart';

// pages
import 'package:dik/Theme/App/Screens/CalendarScreen/calendar_screen.dart';
import 'package:dik/Theme/App/Screens/MapScreen/map_screen.dart';
import 'package:dik/Theme/App/Screens/SearchScreen/search_screen.dart';
import 'package:dik/Theme/App/Screens/HomeScreen/home_screen.dart';
import 'package:dik/Theme/App/Screens/SavedScreen/saved_screen.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// icons
import 'package:dik/theme/MaterialsUI/icons.dart';

// external extentions
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
          gobackbutton: false,
        ),
      ),
      body: _children[currentIndex],
      bottomNavigationBar: MyBottomBar(
        iconColor: iconColor,
        iconSize: screenheight * 4 / 100,
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
            importedIconAVG: true,
            customIcon: CustomIcons.maps,
          ),
          BottomBarItem(
            importedIconAVG: true,
            customIcon: CustomIcons.calendar,
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
