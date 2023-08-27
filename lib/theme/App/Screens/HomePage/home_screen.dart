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
import 'package:dik/Theme/App/Screens/HomePage/selected_page.dart';

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
    return Scaffold(
        backgroundColor: primaryBackgroundColor,
        //
        body: Padding(
          padding: const EdgeInsets.all(8),
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
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Scopri le categorie",
                    style: TextStyle(
                      fontFamily: "Gelion Bold",
                      fontSize: 32,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      CategoryListItem(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Eventi",
                    style: TextStyle(
                      fontFamily: "Gelion Bold",
                      fontSize: 32,
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

//----------------------------------------------------------------------------//

class CategoryListItem extends StatefulWidget {
  const CategoryListItem({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/new_page');
        },
        child: Container(
            height: screenheight * 5 / 100,
            width: screenwidth * 30 / 100,
            decoration: const BoxDecoration(
              color: primaryObjColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(15.0),
            child: const FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    LineAwesomeIcons.theater_masks,
                    size: 24,
                    color: primaryPurple,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Teatro",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Gelion Medium",
                      fontSize: 15,
                      color: primaryPurple,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  const ListItem({
    Key? key,
    required this.title,
    required this.date,
    required this.place,
    required this.time,
    required this.price,
  }) : super(key: key);

  final String title;
  final String date;
  final String time;
  final String place;
  final int price;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  /*double imageHeight = 300;
  double imageWidth = 300;

  void _moveBox() {
    imageHeight == 300
        ? setState(() {
            imageHeight = 100;
            imageWidth = 100;
          })
        : setState(() {
            imageHeight = 300;
            imageWidth = 300;
          });
  }*/

  void timer() {
    Timer(const Duration(milliseconds: 0), () {
      Navigator.pushNamed(context, '/new_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    int price = widget.price;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              //_moveBox();

              timer();
            },
            onDoubleTap: () {
              hyped == true
                  ? setState(() {
                      hyped = false;
                    })
                  : setState(() {
                      hyped = true;
                    });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: screenwidth * 120 / 100,
              decoration: const BoxDecoration(
                color: primaryObjColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: screenwidth * 85 / 100,
                      width: screenwidth * 85 / 100,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child:
                            Image(image: AssetImage(image), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight * 1 / 100,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: "Gelion Bold",
                              fontSize: 24,
                              color: primaryPurple,
                            ),
                          ),
                          SizedBox(height: screenheight * 1 / 100),
                          Text(
                            widget.place,
                            style: const TextStyle(
                              fontFamily: "Gelion Medium",
                              fontSize: 18,
                              color: textColor,
                            ),
                          ),
                          SizedBox(height: screenheight * 1 / 100),
                          Text(
                            widget.date,
                            style: const TextStyle(
                              fontFamily: "Gelion Medium",
                              fontSize: 18,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        children: [
                          SizedBox(height: screenheight * 1 / 100),
                          SizedBox(
                            height: screenwidth * 10 / 100,
                            width: screenwidth * 15 / 100,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: ColoredBox(
                                  color: primaryBackgroundColor,
                                  child: Center(
                                    child: Text(
                                      "$price\$",
                                      style: const TextStyle(
                                        fontFamily: "Gelion Medium",
                                        fontSize: 18,
                                        color: primaryPurple,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(height: screenheight * 1 / 100),
                          const MyButtonHype(),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class MyButtonHype extends StatefulWidget {
  const MyButtonHype({
    Key? key,
  }) : super(key: key);

  @override
  State<MyButtonHype> createState() => _MyButtonHypeState();
}

class _MyButtonHypeState extends State<MyButtonHype> {
  //bool hyped = false;

  @override
  Widget build(BuildContext context) {
    //double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenwidth * 10 / 100,
      width: screenwidth * 15 / 100,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: ColoredBox(
          color: primaryBackgroundColor,
          child: GestureDetector(
            onTap: () {
              hyped == true
                  ? setState(() {
                      hyped = false;
                    })
                  : setState(() {
                      hyped = true;
                    });
            },
            onLongPress: () {
              hyped == true
                  ? setState(() {
                      hyped = false;
                    })
                  : setState(() {
                      hyped = true;
                    });
            },
            child: hyped == false
                ? const Icon(
                    LineAwesomeIcons.heart,
                    size: 28,
                    color: iconColor,
                  )
                : const Icon(
                    LineAwesomeIcons.heart_1,
                    size: 28,
                    color: primaryPurple,
                  ),
          ),
        ),
      ),
    );
  }
}
