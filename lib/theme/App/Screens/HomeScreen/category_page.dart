//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// widgets
import 'package:dik/Theme/Widgets/appbar.dart';

// icons
import 'package:dik/theme/MaterialsUI/icons.dart';

// external extentions
import 'package:flutter_svg/flutter_svg.dart';

//----------------------------------------------------------------------------//

class CategoryPage extends StatelessWidget {
  const CategoryPage(
      {super.key, required this.category, required this.categoryIcon});

  final String category;
  final String categoryIcon;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: primaryBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: const MyAppBar(
          gobackbutton: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenheight * 2.5 / 100),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenheight * 3 / 100),
                SvgPicture.asset(
                  CustomIcons.disco,
                  height: screenwidth * 50 / 100,
                  width: screenwidth * 50 / 100,
                  // ignore: deprecated_member_use
                  color: primaryPurple,
                ),
                SizedBox(height: screenheight * 0.5 / 100),
                Text(
                  "Disco",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: screenheight * 4 / 100,
                    color: primaryPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//
