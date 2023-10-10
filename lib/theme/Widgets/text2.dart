//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

//----------------------------------------------------------------------------//

class Text2 extends StatelessWidget {
  const Text2({
    super.key,
    required this.title,
    this.color,
    this.size,
    this.bold = false,
  });

  final String title;
  final Color? color;
  final double? size;
  final bool? bold;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: bold == true ? "Gelion Bold" : "Gelion Medium",
        fontSize: size ?? screenheight * 2.2 / 100,
        color: color ?? Colors.white,
      ),
    );
  }
}

//----------------------------------------------------------------------------//