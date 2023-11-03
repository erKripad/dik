//----------------------------------------------------------------------------//

// framework
import 'package:dik/Theme/DatabaseSamples/events_examples.dart';
import 'package:dik/Theme/Widgets/title1.dart';
import 'package:flutter/material.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// widgets
import 'package:dik/Theme/Widgets/appbar.dart';
import 'package:dik/Theme/Widgets/title2.dart';
import 'package:dik/Theme/Widgets/text2.dart';
import 'package:dik/Theme/Widgets/compact_event_frame.dart';

// icons
import 'package:dik/theme/MaterialsUI/icons.dart';

// external extentions
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';

// simil-database
import 'package:dik/Theme/DatabaseSamples/events_examples.dart';

//----------------------------------------------------------------------------//

class HostPage extends StatefulWidget {
  const HostPage({
    super.key,
    required this.host,
  });

  final String host;

  @override
  State<HostPage> createState() => _SelectedPageState();
}

class _SelectedPageState extends State<HostPage> {
  PaletteGenerator? paletteGenerator;
  Color defaultColor = primaryBackgroundColor;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: MyAppBar(
          hype: false,
          gobackbutton: true,
        ),
      ),
      backgroundColor: primaryBackgroundColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Padding(
              padding: EdgeInsets.all(screenheight * 2.5 / 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenheight * 6 / 100,
                  ),
                  Center(
                    child: SizedBox(
                      height: screenwidth * 60 / 100,
                      width: screenwidth * 60 / 100,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image(
                            image: AssetImage("assets/concerto.jpeg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight * 2 / 100,
                  ),
                  Title1(title: widget.host),
                ],
              ),
            )),
            Padding(
                padding: EdgeInsets.all(screenheight * 2.5 / 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*DescriptionBox(
                      initialHeight: screenheight * 6 / 100,
                      finallHeight: screenheight * 30 / 100,
                      titleColor: textColor,
                    ),*/
                    const Title2(
                      title: "Events",
                      color: textColor,
                    ),
                    SizedBox(height: screenheight * 2 / 100),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.fast),
                        child: Row(
                          children: [
                            CompactEventFrameItem(
                                title: title,
                                date: date,
                                place: place,
                                time: time,
                                price: price,
                                category: category,
                                image: image),
                            CompactEventFrameItem(
                                title: title,
                                date: date,
                                place: place,
                                time: time,
                                price: price,
                                category: category,
                                image: image)
                          ],
                        )),
                    SizedBox(height: screenheight * 3 / 100),
                    const Title2(
                      title: "Photos",
                      color: textColor,
                    ),
                    SizedBox(height: screenheight * 1 / 100),
                    SizedBox(height: screenheight * 3 / 100),
                    const Title2(
                      title: "Reviews",
                      color: textColor,
                    ),
                    SizedBox(height: screenheight * 1 / 100),
                    SizedBox(height: screenheight * 3 / 100),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class DescriptionBox extends StatefulWidget {
  const DescriptionBox({
    super.key,
    required this.initialHeight,
    required this.finallHeight,
    this.titleColor,
  });

  final double initialHeight;
  final double finallHeight;
  final Color? titleColor;

  @override
  State<StatefulWidget> createState() => DescriptionBoxState();
}

class DescriptionBoxState extends State<DescriptionBox> {
  _descriptionBoxAnimation(double newHeight) {
    setState(() {
      _descriptionBoxHeight = newHeight;
      if (clicked == false) {
        clicked = true;
        //colorContainer = primaryBackgroundColor;
      } else {
        clicked = false;
      }
    });
  }

  double _descriptionBoxHeight = 50;

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => clicked == true
          ? _descriptionBoxAnimation(50)
          : _descriptionBoxAnimation(widget.finallHeight),
      child: AnimatedContainer(
        height: _descriptionBoxHeight,
        width: screenwidth * 95 / 100,
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          "descrizione",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: "Gelion Medium",
            fontSize: 14,
            color: widget.titleColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
