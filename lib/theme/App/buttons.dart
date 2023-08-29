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

class ButtonHype extends StatefulWidget {
  ButtonHype({
    super.key,
    required this.hyped,
    this.size,
    this.selectedColor,
    this.unselectedColor,
  });

  bool hyped;
  double? size;
  Color? unselectedColor;
  Color? selectedColor;

  @override
  State<ButtonHype> createState() => ButtonHypeState();
}

class ButtonHypeState extends State<ButtonHype> {
  //bool hyped = false;

  @override
  Widget build(BuildContext context) {
    //double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        widget.hyped == true
            ? setState(() {
                widget.hyped = false;
                hyped = false;
              })
            : setState(() {
                widget.hyped = true;
                hyped = true;
              });
      },
      onLongPress: () {
        widget.hyped == true
            ? setState(() {
                widget.hyped = false;
                hyped = false;
              })
            : setState(() {
                widget.hyped = true;
                hyped = true;
              });
      },
      child: widget.hyped == false
          ? Icon(
              LineAwesomeIcons.heart,
              size: widget.size ?? 28,
              color: widget.unselectedColor ?? Colors.white,
            )
          : Icon(
              LineAwesomeIcons.heart_1,
              size: widget.size ?? 28,
              color: widget.selectedColor ?? Colors.white,
            ),
    );
  }
}
