//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:infinite_scroll/infinite_scroll.dart';

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
      backgroundColor: const Color.fromARGB(255, 25, 24, 28),
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
      child: BlurryContainer(
        color: const Color.fromARGB(255, 33, 32, 35),
        blur: 8,
        elevation: 6,
        width: 00,
        height: 480,
        padding: const EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                width: 350,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: const Image(image: AssetImage("assets/papera.jpg")),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Caccia alle Papere",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: 25,
                  color: Color.fromARGB(255, 165, 126, 255),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//
