//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// simil-database
import 'package:dik/Theme/events_examples.dart';

// external extentions
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// unused extentions

//import 'package:flutter/scheduler.dart';
//import 'package:animations/animations.dart';
//import 'package:infinite_scroll/infinite_scroll.dart';

//----------------------------------------------------------------------------//

// ignore: must_be_immutable
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
  @override
  Widget build(BuildContext context) {
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

//----------------------------------------------------------------------------//