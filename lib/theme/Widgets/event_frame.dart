//----------------------------------------------------------------------------//

// framework
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:dik/Theme/Widgets/hype_button.dart';
import 'package:dik/Theme/App/Screens/HomeScreen/selected_page.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// simil-database
import 'package:dik/Theme/DatabaseSamples/events_examples.dart';

// external extentions
import 'package:flutter_svg/flutter_svg.dart';

//----------------------------------------------------------------------------//

class ListItem extends StatefulWidget {
  const ListItem({
    Key? key,
    required this.title,
    required this.date,
    required this.place,
    required this.time,
    required this.price,
    required this.category,
    required this.image,
    //required this.onTapDestination,
  }) : super(key: key);

  final String category;
  final String date;
  final String image;
  final String place;
  final int price;
  final String time;
  final String title;

  //final String onTapDestination;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  _getRequests() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Future.microtask(
                () => Timer(Duration(milliseconds: 400), () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          fullscreenDialog: false,
                          builder: (context) => SelectedPage()));
                }),
              ).then((val) => {_getRequests()}),
              onDoubleTap: () {
                hyped == true
                    ? setState(() {
                        hyped = false;
                      })
                    : setState(() {
                        hyped = true;
                      });
              },
              child: Container(
                height: screenwidth * 120 / 100,
                decoration: BoxDecoration(
                  color: primaryObjColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                padding: EdgeInsets.all(screenwidth * 5 / 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenwidth * 88 / 100,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Image(
                            image: AssetImage(widget.image), fit: BoxFit.fill),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(
                                flex: 2,
                              ),
                              Text(
                                widget.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: "Gelion Bold",
                                  fontSize: screenheight * 3 / 100,
                                  color: primaryPurple,
                                ),
                              ),
                              const Spacer(),
                              EventInfo(
                                  category: widget.category,
                                  date: widget.date,
                                  time: widget.time),
                              const Spacer(),
                              Text(
                                widget.place,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontFamily: "Gelion Medium",
                                  fontSize: 18,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                          eventButtons(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: screenheight * 2 / 100,
      )
    ]);
  }

  Widget eventButtons(BuildContext context) {
    //double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(
          flex: 2,
        ),
        Container(
          height: screenwidth * 10 / 100,
          width: screenwidth * 14 / 100,
          decoration: const BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              "$price\$",
              style: const TextStyle(
                fontFamily: "Gelion Medium",
                fontSize: 18,
                color: primaryPurple,
              ),
            ),
          ),
        ),
        const Spacer(),
        Container(
          height: screenwidth * 10 / 100,
          width: screenwidth * 14 / 100,
          decoration: const BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: ButtonHype(
            hyped: hyped,
            selectedColor: primaryPurple,
          ),
        ),
      ],
    );
  }
}

//----------------------------------------------------------------------------//

class EventInfo extends StatelessWidget {
  const EventInfo({
    super.key,
    required this.category,
    required this.date,
    required this.time,
  });

  final String category;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SvgPicture.asset(
          category,
          height: screenheight * 4 / 100,
          width: screenheight * 4 / 100,
          // ignore: deprecated_member_use
          color: iconColor,
        ),
        SizedBox(width: screenwidth * 2 / 100),
        const Text(
          "·",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 18,
            color: textColor,
          ),
        ),
        SizedBox(width: screenwidth * 2 / 100),
        Text(
          date,
          style: const TextStyle(
            fontFamily: "Gelion Medium",
            fontSize: 18,
            color: textColor,
          ),
        ),
        SizedBox(width: screenwidth * 2 / 100),
        const Text(
          "·",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 18,
            color: textColor,
          ),
        ),
        SizedBox(width: screenwidth * 2 / 100),
        Text(
          time,
          style: const TextStyle(
            fontFamily: "Gelion Medium",
            fontSize: 18,
            color: textColor,
          ),
        ),
      ],
    );
  }
}

//----------------------------------------------------------------------------//
