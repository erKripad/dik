//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// widgets
import 'package:dik/Theme/Widgets/event_frame.dart';
import 'package:dik/Theme/Widgets/category_frame_item.dart';
import 'package:dik/Theme/App/Screens/HomeScreen/category_page.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// icons
import 'package:dik/Theme/MaterialsUI/icons.dart';

// simil-database
import 'package:dik/Theme/DatabaseSamples/events_examples.dart';

// firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// external extentions
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: primaryBackgroundColor,
        //
        body: Padding(
          padding: EdgeInsets.all(screenwidth * 3 / 100),
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

                // * creazione dei category-widgets tramite firestore

                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("categories")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        // TODO: creare widget che aspetta 500 ms poi fa coomparire il caricamento
                        ? Center(
                            child: SpinKitWave(
                              color: primaryPurple,
                              size: screenheight * 2.5 / 100,
                            ),
                          )
                        : SizedBox(
                            height: screenheight * 8 / 100,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(
                                  decelerationRate:
                                      ScrollDecelerationRate.fast),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot category =
                                    snapshot.data!.docs[index];
                                return CategoryListItem(
                                  text: category['category'],
                                  icon: category['categoryIcon'],
                                  onPress: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoryPage(
                                        category: category['category'],
                                        categoryIcon: category['categoryIcon'],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  },
                ),

                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: EdgeInsets.all(screenheight * 0.5 / 100),
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
                      image: image,
                      category: CustomIcons.disco,
                      //onTapDestination: ,
                    ),
                    ListItem(
                      title: title,
                      place: place,
                      date: date,
                      time: time,
                      price: price,
                      image: "assets/prova2.jpg",
                      category: CustomIcons.disco,
                      //onTapDestination: ,
                    ),
                    ListItem(
                      title: title,
                      place: place,
                      date: date,
                      time: time,
                      price: price,
                      category: CustomIcons.disco,
                      image: "assets/prova3.jpg",
                      //onTapDestination: ,
                    ),
                    ListItem(
                      title: title,
                      place: place,
                      date: date,
                      time: time,
                      price: price,
                      category: CustomIcons.disco,
                      image: "assets/prova4.png",
                      //onTapDestination: ,
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

Future<void> loadSettings() async {
  await Future.delayed(Duration(seconds: 5));
}
