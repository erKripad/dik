//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:animations/animations.dart';
//import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:infinite_scroll/infinite_scroll.dart';
import 'package:dik/Theme/colors.dart';

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
      backgroundColor: primaryBackgroundColour,
      //
      body: InfiniteScrollList(
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
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        //blur: 8,
        //elevation: 6,
        decoration: BoxDecoration(
          color: primaryPurple,
          /*border: Border.all(
            color: Colors.black,
            width: 1,
          ),*/
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        width: 00,
        height: 480,
        padding: const EdgeInsets.all(15.0),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                width: 350,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Image(
                      image: AssetImage("assets/papera.jpg"), fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Caccia alle Papere",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: 25,
                  color: Color.fromARGB(255, 165, 126, 255),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              /*Row(
                children: [
                  RichText(
                      text: const TextSpan(children: [
                    WidgetSpan(
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
                        color: Colors.white,
                      ),
                    ),
                  ]))
                ],
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//
