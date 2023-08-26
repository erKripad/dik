//----------------------------------------------------------------------------//

import 'package:dik/Theme/colors.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:dik/Theme/icons.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

//----------------------------------------------------------------------------//

class BottomBarItem {
  BottomBarItem({this.iconData, this.customIcon, this.importedIconAVG});
  final IconData? iconData;
  final String? customIcon;
  final bool? importedIconAVG;
}

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({
    super.key,
    required this.items,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.selectedColor,
    required this.onTabSelected,
  });
  final List<BottomBarItem> items;

  final double? iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? selectedColor;

  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => MyBottomBarState();
}

class MyBottomBarState extends State<MyBottomBar> {
  _changeIndex(int index) {
    widget.onTabSelected(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _changeIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return Container(
      color: widget.backgroundColor ?? Colors.transparent,
      child: Row(
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    double screenheight = MediaQuery.of(context).size.height;
    //double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenheight * 9 / 100,
      child: Column(
        children: <Widget>[
          SizedBox(height: widget.iconSize ?? screenheight * 4 / 100),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required BottomBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    //double screenheight = MediaQuery.of(context).size.height;
    //double screenwidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(index),
        child: item.importedIconAVG == false
            ? Icon(
                item.iconData ?? Icons.question_mark,
                size: widget.iconSize ?? 32,
                color: widget.iconColor ?? Colors.white,
              )
            : SvgPicture.asset(
                item.customIcon ?? CustomIcons.home,
                height: 36,
                width: 36,
                // ignore: deprecated_member_use
                color: iconColor,
              ),
      ),
    );
  }
}
