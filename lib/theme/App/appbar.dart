//----------------------------------------------------------------------------//

// ignore: unused_import
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// ignore: unused_import
import 'package:dik/Theme/icons.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dik/Theme/events_examples.dart';
import 'package:dik/Theme/App/buttons.dart';

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
        child: Padding(
          padding: EdgeInsets.all(screenheight * 0.5 / 100),
          child: SizedBox(
            height: screenheight * 10 / 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    widget.gobackbutton == true
                        ? Row(
                            children: [GoBackButton(iconSize: widget.iconSize)],
                          )
                        : SizedBox(width: screenwidth * 4 / 100),
                    GestureDetector(
                      onTap: () {
                        //_scrollController;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          widget.title ?? "",
                          style: TextStyle(
                            fontFamily: "Gelion Bold",
                            fontSize: screenheight * 4 / 100,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    widget.notifications == true
                        ? NotificationsButton(iconSize: screenheight * 5 / 100)
                        : const SizedBox(),
                    widget.profile == true
                        ? ProfileButton(iconSize: screenheight * 5 / 100)
                        : const SizedBox(),
                    widget.hype == true
                        ? ButtonHype(
                            size: screenheight * 4.5 / 100,
                            hyped: hyped,
                            selectedColor: widget.hypeColor,
                            unselectedColor: iconColor,
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ));
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
    double screenheight = MediaQuery.of(context).size.height;
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
            width: iconSize ?? screenheight * 5 / 100,
            height: iconSize ?? screenheight * 5 / 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage(image ?? "assets/immagine di profilo.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(width: screenwidth * 4 / 100),
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
        SizedBox(width: screenwidth * 4 / 100),
      ],
    );
  }
}

//----------------------------------------------------------------------------//

class GoBackButton extends StatefulWidget {
  final double? iconSize;

  const GoBackButton({
    super.key,
    this.iconSize,
  });

  @override
  State<GoBackButton> createState() => _GoBackButtonState();
}

class _GoBackButtonState extends State<GoBackButton> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: screenwidth * 4 / 100,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: widget.iconSize ?? 26,
            color: iconColor,
          ),
        )
      ],
    );
  }
}

//----------------------------------------------------------------------------//