//----------------------------------------------------------------------------//

// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
//import 'package:animations/animations.dart';
//import 'package:infinite_scroll/infinite_scroll.dart';
import 'package:dik/Theme/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dik/Theme/events_examples.dart';
import 'package:dik/Theme/App/selected_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dik/Theme/icons.dart';
import 'package:dik/Theme/App/list_item.dart';
import 'package:dik/Theme/App/category_list_item.dart';

//----------------------------------------------------------------------------//

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//----------------------------------------------------------------------------//

class _HomeScreenState extends State<HomeScreen> {
  Future<List<String>> getNextPageData(int page) async {
    await Future.delayed(const Duration(seconds: 1));
    final items = List<String>.generate(5, (i) => "Item $i Page $page");
    return items;
  }

  List<String> data = [];
  bool everyThingLoaded = false;

  @override
  void initState() {
    super.initState();

    loadInitialData();
  }

  Future<void> loadInitialData() async {
    data = await getNextPageData(0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: primaryBackgroundColor,
        //
        body: Padding(
          padding: EdgeInsets.all(screenheight * 1.5 / 100),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(screenheight * 0.5 / 100),
                  child: Text(
                    "Scopri le categorie",
                    style: TextStyle(
                      fontFamily: "Gelion Bold",
                      fontSize: screenheight * 3.5 / 100,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryListItem(
                          text: "Discoteca",
                          icon: CustomIcons.disco,
                          onTapDestination: "/new_category_page"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Eventi",
                    style: TextStyle(
                      fontFamily: "Gelion Bold",
                      fontSize: screenheight * 3.5 / 100,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    ListItem(
                      title: title,
                      place: place,
                      date: date,
                      time: time,
                      price: price,
                      category: CustomIcons.disco,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ));
  }
}
