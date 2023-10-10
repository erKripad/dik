//----------------------------------------------------------------------------//

// import 'package:dik/Theme/colors.dart';

// dart
import 'dart:io' show Platform;

// framework
import 'package:flutter/material.dart';

// icons
import 'package:dik/Theme/MaterialsUI/icons.dart';

// external extentions
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
  int _currentindex = 0;

  _changeIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _changeIndex,
      );
    });

    return Container(
      height: screenheight * 10 / 100,
      color: widget.backgroundColor ?? Colors.transparent,
      child: Row(
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    required BottomBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    double screenheight = MediaQuery.of(context).size.height;

    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        GestureDetector(
          onTap: () => onPressed(index),
          child: item.importedIconAVG == false
              ? Icon(
                  item.iconData ?? Icons.question_mark,
                  size: widget.iconSize ?? screenheight * 4 / 100,
                  color: index == _currentindex
                      ? widget.selectedColor
                      : widget.iconColor,
                )
              : SvgPicture.asset(
                  item.customIcon ?? CustomIcons.home,
                  height: widget.iconSize ?? screenheight * 4 / 100,
                  width: widget.iconSize ?? screenheight * 4 / 100,
                  // ignore: deprecated_member_use
                  color: index == _currentindex
                      ? widget.selectedColor
                      : widget.iconColor,
                ),
        ),
        Platform.isIOS
            ? SizedBox(height: screenheight * 2 / 100)
            : const SizedBox(),
      ],
    ));
  }
}
