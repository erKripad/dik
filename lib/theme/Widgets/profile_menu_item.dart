//----------------------------------------------------------------------------//

//framework
import 'package:dik/Theme/Widgets/text2.dart';
import 'package:flutter/material.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

//----------------------------------------------------------------------------//

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenheight * 6 / 100,
      child: GestureDetector(
        onTap: onPress,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: screenwidth * 2 / 100),
            Center(
              child: Container(
                height: screenheight * 5 / 100,
                width: screenheight * 5 / 100,
                decoration: BoxDecoration(
                  color: primaryObjColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(icon, color: textColor),
              ),
            ),
            SizedBox(width: screenwidth * 7 / 100),
            Center(child: Text2(title: title, bold: true)),
          ],
        ),
      ),
    );
  }
}
