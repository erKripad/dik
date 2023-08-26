//----------------------------------------------------------------------------//

// ignore: unused_import
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// ignore: unused_import
import 'package:dik/theme/icons.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dik/theme/events_examples.dart';

//----------------------------------------------------------------------------//

/*var _scrollController = ScrollController();

void goUp() {
  _scrollController.animateTo(
    0.0,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutQuart,
  );
}*/

//----------------------------------------------------------------------------//

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    Key? key,
    this.title,
    this.notifications,
    this.profile,
    this.hype,
    this.gobackbutton,
    this.hypeColor,
    this.iconSize,
  }) : super(key: key);

  final double? iconSize;
  final String? title;
  final bool? profile;
  final bool? notifications;
  final bool? hype;
  final bool? gobackbutton;
  final Color? hypeColor;

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
                            GoBackButton(iconSize: widget.iconSize)
                          ],
                        )
                      : SizedBox(
                          width: screenwidth * 1 / 100,
                        ),
                  GestureDetector(
                    onTap: () {
                      //_scrollController;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        widget.title ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Gelion Bold",
                          fontSize: 34,
                          color: textColor,
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
                            ? const NotificationsButton(iconSize: 40)
                            : const SizedBox(),
                        widget.profile == true
                            ? const ProfileButton(iconSize: 46)
                            : const SizedBox(),
                        widget.hype == true
                            ? MyAppbarButtonHype(
                                color: widget.hypeColor,
                              )
                            : const SizedBox(),
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

//----------------------------------------------------------------------------//

class MyAppbarButtonHype extends StatefulWidget {
  final Color? color;

  const MyAppbarButtonHype({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  State<MyAppbarButtonHype> createState() => _MyAppbarButtonHypeState();
}

class _MyAppbarButtonHypeState extends State<MyAppbarButtonHype> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "appbarhypebtn",
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
              color: iconColor,
            )
          : Icon(
              LineAwesomeIcons.heart_1,
              size: 35,
              color: widget.color ?? primaryPurple,
            ),
    );
  }
}

//----------------------------------------------------------------------------//

class ProfileButton extends StatelessWidget {
  final double? iconSize;
  final String? image;

  const ProfileButton({
    Key? key,
    this.iconSize,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        //SizedBox(width: screenwidth * 3 / 100),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
          onLongPress: () {
            Navigator.pushNamed(context, '/profile');
          },
          child: SizedBox(
            width: iconSize ?? 32,
            height: iconSize ?? 32,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage(image ?? "assets/immagine di profilo.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(width: screenwidth * 5 / 100),
      ],
    );
  }
}

//----------------------------------------------------------------------------//

class NotificationsButton extends StatelessWidget {
  final double? iconSize;
  final Color? color;

  const NotificationsButton({
    super.key,
    this.iconSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        //SizedBox(width: screenwidth * 3 / 100),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/notifications');
          },
          onLongPress: () {
            //color = iconColor.withOpacity(0.5);
          },
          child: Icon(
            LineAwesomeIcons.bell,
            size: iconSize ?? 32,
            color: color ?? iconColor,
          ),
        ),
        SizedBox(width: screenwidth * 5 / 100),
      ],
    );
  }
}

//----------------------------------------------------------------------------//

class GoBackButton extends StatelessWidget {
  final double? iconSize;

  const GoBackButton({
    super.key,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        size: iconSize ?? 26,
        color: iconColor,
      ),
    );
  }
}

//----------------------------------------------------------------------------//