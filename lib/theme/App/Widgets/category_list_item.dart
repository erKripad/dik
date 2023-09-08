//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// colors
import 'package:dik/Theme/colors.dart';

// external extentions
import 'package:flutter_svg/flutter_svg.dart';

// unused extentions

//import 'package:flutter/scheduler.dart';
//import 'package:animations/animations.dart';
//import 'package:infinite_scroll/infinite_scroll.dart';

//----------------------------------------------------------------------------//

class CategoryListItem extends StatefulWidget {
  const CategoryListItem({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.icon,
    required this.text,
    required this.onTapDestination,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final String icon;
  final String text;
  final String onTapDestination;

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          height: screenheight * 7 / 100,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? primaryObjColor,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          padding: EdgeInsets.all(
            screenheight * 1 / 100,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, widget.onTapDestination);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenwidth * 1 / 100,
                ),
                SvgPicture.asset(
                  widget.icon,
                  height: screenheight * 3.5 / 100,
                  width: screenheight * 3.5 / 100,
                  // ignore: deprecated_member_use
                  color: widget.textColor ?? primaryPurple,
                ),
                SizedBox(
                  width: screenwidth * 1 / 100,
                ),
                Text(
                  widget.text,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: screenheight * 2 / 100,
                    color: widget.textColor ?? primaryPurple,
                  ),
                ),
                SizedBox(
                  width: screenwidth * 1 / 100,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: screenwidth * 3 / 100,
        )
      ],
    );
  }
}

//----------------------------------------------------------------------------//
