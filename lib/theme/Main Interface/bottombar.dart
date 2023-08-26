//----------------------------------------------------------------------------//

import 'package:dik/theme/colors.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:dik/theme/icons.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

//----------------------------------------------------------------------------//

class MyBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int?)? onTap;

  const MyBottomBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });
  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    //int currentIndex = widget.currentIndex;

    List<Widget> bottombaritems = [
      BottomBarItem(
          iconColor: iconColor,
          iconSize: 36,
          importedIconAVG: true,
          customIcon: CustomIcons.home,
          onPressed: () {
            widget.onTap!(0);
          }),
      BottomBarItem(
        iconColor: iconColor,
        iconSize: 38,
        importedIconAVG: false,
        iconData: LineAwesomeIcons.search,
        onPressed: widget.onTap!(1),
      ),
      BottomBarItem(
        iconColor: iconColor,
        iconSize: 38,
        importedIconAVG: false,
        iconData: LineAwesomeIcons.heart,
        onPressed: widget.onTap!(2),
      ),
      BottomBarItem(
        iconColor: iconColor,
        iconSize: 38,
        importedIconAVG: false,
        iconData: LineAwesomeIcons.map_marked,
        onPressed: widget.onTap!(3),
      ),
      BottomBarItem(
        iconColor: iconColor,
        iconSize: 36,
        importedIconAVG: true,
        customIcon: CustomIcons.empty_calendar,
        onPressed: widget.onTap!(4),
      ),
    ];

    return SizedBox(
      height: screenheight * 10 / 100,
      child: Container(
        color: primaryBackgroundColor,
        padding: EdgeInsets.only(top: screenheight * 2 / 100),
        //child: const Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottombaritems[0],
            bottombaritems[1],
            bottombaritems[2],
            bottombaritems[3],
            bottombaritems[4],
          ],
        ),
      ),
      //),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final double? iconSize;
  final Color? iconColor;
  final IconData? iconData;
  final String? customIcon;
  final bool? importedIconAVG;
  final Function()? onPressed;
  const BottomBarItem({
    super.key,
    this.iconSize,
    this.iconColor,
    this.iconData,
    this.customIcon,
    this.importedIconAVG,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPressed!();
          print("palle");
        },
        child: importedIconAVG == false
            ? Icon(
                iconData ?? Icons.question_mark,
                size: iconSize ?? 32,
                color: iconColor ?? Colors.white,
              )
            : SvgPicture.asset(
                customIcon ?? CustomIcons.home,
                height: 36,
                width: 36,
                // ignore: deprecated_member_use
                color: iconColor,
              ),
      ),
    );
  }
}
