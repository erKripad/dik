// ignore: unused_import
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// ignore: unused_import
import 'package:dik/theme/icons.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

var _scrollController = ScrollController();

void goUp() {
  _scrollController.animateTo(
    0.0,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutQuart,
  );
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    Key? key,
    this.title,
    this.notifications,
    this.profile,
    this.hype,
    this.gobackbutton,
  }) : super(key: key);

  final String? title;
  final bool? profile;
  final bool? notifications;
  final bool? hype;
  final bool? gobackbutton;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenwidth * 1 / 100,
                  ),
                  widget.gobackbutton == true
                      ? Row(
                          children: [
                            SizedBox(
                              width: screenwidth * 3 / 100,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                size: 25,
                                color: iconColour,
                              ),
                            )
                          ],
                        )
                      : SizedBox(
                          width: screenwidth * 1 / 100,
                        ),
                  GestureDetector(
                    onTap: () {
                      _scrollController;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                    widget.title ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Gelion Bold",
                      fontSize: 30,
                      color: textColour,
                    ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      children: [
                        widget.notifications == true
                            ? const MyAppbarButtonNotifications()
                            : const SizedBox(),
                        widget.profile == true
                            ? const MyAppbarButtonProfile()
                            : const SizedBox(),
                        widget.hype == true ? const MyAppbarButtonHype() : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MyAppbarButtonHype extends StatefulWidget {
  const MyAppbarButtonHype({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAppbarButtonHype> createState() => _MyAppbarButtonHypeState();
}

class _MyAppbarButtonHypeState extends State<MyAppbarButtonHype> {
  bool hyped = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        hyped == true
            ? setState(() {
                hyped = false;
              })
            : setState(() {
                hyped = true;
              });
      },
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: hyped == false
          ? const Icon(
              LineAwesomeIcons.heart,
              size: 35,
              color: iconColour,
            )
          : const Icon(
              LineAwesomeIcons.heart_1,
              size: 35,
              color: iconColour,
            ),
    );
  }
}

class MyAppbarButtonProfile extends StatelessWidget {
  const MyAppbarButtonProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/profile');
      },
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 40,
        height: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: const Image(
            image: AssetImage("assets/immagine di profilo.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class MyAppbarButtonNotifications extends StatelessWidget {
  const MyAppbarButtonNotifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/notifications');
      },
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: const Icon(
        LineAwesomeIcons.bell,
        size: 35,
        color: iconColour,
      ),
    );
  }
}
