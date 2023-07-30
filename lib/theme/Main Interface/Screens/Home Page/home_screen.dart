//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
//import 'package:animations/animations.dart';
//import 'package:infinite_scroll/infinite_scroll.dart';
import 'package:dik/Theme/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
    return const Scaffold(
        backgroundColor: primaryBackgroundColour,
        //
        body: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Scopri le categorie",
                    style: TextStyle(
                      fontFamily: "Gelion Bold",
                      fontSize: 26,
                      color: textColour,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      CategoryListItem(),
                      CategoryListItem(),
                      CategoryListItem(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Eventi",
                    style: TextStyle(
                      fontFamily: "Gelion Bold",
                      fontSize: 26,
                      color: textColour,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    ListItem(),
                    ListItem(),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
            /*InfiniteScrollList(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                onLoadingStart: (page) async {
                  List<String> newData = await getNextPageData(page);
                  setState(() {
                    data += newData;
                    if (newData.isEmpty) {
                      everyThingLoaded = true;
                    }
                  });
                },
                everythingLoaded: everyThingLoaded,
                children: data.map((e) => const ListItem()).toList(),
              ),*/
          ),
        ));
  }
}

//----------------------------------------------------------------------------//

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key? key,
  }) : super(key: key);

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
            height: screenheight / 14,
            width: screenwidth / 3,
            decoration: BoxDecoration(
              color: primaryObjColour,
              borderRadius: const BorderRadius.all(Radius.circular(45)),
            ),
            padding: const EdgeInsets.all(14.0),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    LineAwesomeIcons.theater_masks,
                    size: 24,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Teatro",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Gelion Medium",
                      fontSize: 16,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/new_page');
              },
              child: Container(
                height: screenheight * 2 / 3,
                decoration: BoxDecoration(
                  color: primaryObjColour,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 350,
                        width: 350,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Image(
                              image: AssetImage("assets/papera.jpg"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Caccia alle Papere",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Gelion Bold",
                          fontSize: 25,
                          color: primaryPurple,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.place,
                                    size: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: "Catanzaro",
                                  style: TextStyle(
                                    fontFamily: "Gelion Medium",
                                    fontSize: 18,
                                    color: textColour,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}

//----------------------------------------------------------------------------//
