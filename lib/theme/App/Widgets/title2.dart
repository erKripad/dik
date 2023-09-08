//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

//----------------------------------------------------------------------------//

class Title2 extends StatelessWidget {
  const Title2({
    super.key,
    required this.title,
    this.color,
    this.size,
  });

  final String title;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: "Gelion Bold",
        fontSize: size ?? screenheight * 3 / 100,
        color: color ?? Colors.white,
      ),
    );
  }
}

//----------------------------------------------------------------------------//
