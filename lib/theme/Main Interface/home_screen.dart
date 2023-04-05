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
    //if (page == 3) return [];
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
      backgroundColor: Colors.purple.shade300,
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
      padding: const EdgeInsets.all(10.0),
      child: BlurryContainer(
        color: Colors.black.withOpacity(0.8),
        blur: 8,
        elevation: 6,
        height: 200,
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            const Image(image: AssetImage("assets/bar.jpg")),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 140,
                      child: Text(
                        "Evento",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Prompt",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 50,
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 15,
                            width: 50,
                            child: Text(
                              "20",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontFamily: "Prompt", fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                            width: 50,
                            child: Text(
                              "Jan",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontFamily: "Prompt", fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.white),
                const SizedBox(
                  height: 20,
                  child: Text("ciao"),
                ),
                const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//
