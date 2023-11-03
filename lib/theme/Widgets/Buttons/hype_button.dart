//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// simil-database
import 'package:dik/Theme/DatabaseSamples/events_examples.dart';

// external extentions
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

//----------------------------------------------------------------------------//

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
    double screenheight = MediaQuery.of(context).size.height;

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
              size: widget.size ?? screenheight * 3.5 / 100,
              color: widget.unselectedColor ?? Colors.white,
            )
          : Icon(
              LineAwesomeIcons.heart_1,
              size: widget.size ?? screenheight * 3.5 / 100,
              color: widget.selectedColor ?? Colors.white,
            ),
    );
  }
}

//----------------------------------------------------------------------------//