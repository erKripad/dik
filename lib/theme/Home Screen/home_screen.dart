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
        children: data.map((e) => const ListItem()).toList(),
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
        color: Colors.black.withOpacity(0.7),
        blur: 8,
        elevation: 6,
        height: 450,
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text("Nome Pub", style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            SizedBox(
              height: 349,
              //width: ,
              child: Row(
                children: const [
                  Expanded(
                    flex: 5,
                    child: Image(image: AssetImage("assets/bar.jpg")),
                  ),
                  VerticalDivider(
                    color: Colors.white,
                  ),
                  Expanded(child: Text("")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//
