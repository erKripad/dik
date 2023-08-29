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
import 'package:dik/Theme/App/buttons.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    Key? key,
    required this.title,
    required this.date,
    required this.place,
    required this.time,
    required this.price,
    required this.category,
  }) : super(key: key);

  final String title;
  final String date;
  final String time;
  final String place;
  final String category;
  final int price;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  _getRequests() async {}
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
              //Navigator.pushNamed(context, '/new_page');
              Navigator.of(context)
                  .push(
                    new MaterialPageRoute(builder: (_) => new SelectedPage()),
                  )
                  .then((val) => val ? _getRequests() : null);
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
            child: Container(
              height: screenwidth * 120 / 100,
              decoration: BoxDecoration(
                color: primaryObjColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Container(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child:
                            Image(image: AssetImage(image), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: "Gelion Bold",
                          fontSize: screenheight * 3.5 / 100,
                          color: primaryPurple,
                        ),
                      ),
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EventInfo(
                          category: widget.category,
                          date: widget.date,
                          time: widget.time),
                      Container(
                        height: screenwidth * 10 / 100,
                        width: screenwidth * 15 / 100,
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventInfo extends StatelessWidget {
  EventInfo({
    super.key,
    required this.category,
    required this.date,
    required this.time,
  });

  final String date;
  final String time;

  final String category;

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
