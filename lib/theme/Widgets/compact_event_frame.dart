//----------------------------------------------------------------------------//

// framework
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:dik/Theme/Widgets/Buttons/hype_button.dart';
import 'package:dik/Theme/App/Screens/HomeScreen/selected_page.dart';
import 'package:dik/Theme/Widgets/text2.dart';
import 'package:dik/Theme/Widgets/title2.dart';

// icons
import 'package:dik/Theme/MaterialsUI/icons.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// simil-database
import 'package:dik/Theme/DatabaseSamples/events_examples.dart';

// external extentions
import 'package:flutter_svg/flutter_svg.dart';

//----------------------------------------------------------------------------//

class CompactEventFrameItem extends StatefulWidget {
  const CompactEventFrameItem({
    Key? key,
    required this.title,
    required this.date,
    required this.place,
    required this.time,
    required this.price,
    required this.category,
    required this.image,
    //required this.onTapDestination,
  }) : super(key: key);

  final String category;
  final String date;
  final String image;
  final String place;
  final int price;
  final String time;
  final String title;

  @override
  State<CompactEventFrameItem> createState() => CompactEventFrameItemState();
}

class CompactEventFrameItemState extends State<CompactEventFrameItem> {
  _getRequests() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, 0, screenwidth * 5 / 100, screenheight * 2 / 100),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(
                  MaterialPageRoute(builder: (_) => const SelectedPage()),
                )
                .then((val) => {_getRequests()}),
            onDoubleTap: () {
              hyped == true
                  ? setState(() {
                      hyped = false;
                    })
                  : setState(() {
                      hyped = true;
                    });
            },
            child: Container(
              height: screenheight * 18 / 100,
              width: screenwidth * 80 / 100,
              decoration: const BoxDecoration(
                color: primaryObjColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              padding: EdgeInsets.all(screenwidth * 2.5 / 100),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenheight * 17 / 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image(
                          image: AssetImage(widget.image), fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(width: screenwidth * 4 / 100),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Title2(
                                title: widget.title,
                                color: primaryPurple,
                              ),
                              const Spacer(),
                              ButtonHype(
                                hyped: hyped,
                                selectedColor: primaryPurple,
                                unselectedColor: primaryPurple,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                CustomIcons.map_pin,
                                height: screenheight * 2.5 / 100,
                                width: screenheight * 2.5 / 100,
                                // ignore: deprecated_member_use
                                color: iconColor,
                              ),
                              SizedBox(width: screenwidth * 2 / 100),
                              Text2(
                                title: place,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Row(
                            children: [
                              EventInfo(
                                date: widget.date,
                                time: widget.time,
                                price: widget.price,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                widget.category,
                                height: screenheight * 4 / 100,
                                width: screenheight * 4 / 100,
                                // ignore: deprecated_member_use
                                color: primaryPurple,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class EventInfo extends StatelessWidget {
  const EventInfo({
    super.key,
    required this.date,
    required this.time,
    required this.price,
  });

  final String date;
  final String time;
  final int price;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Text2(
          title: "$price\$",
        ),
        SizedBox(width: screenwidth * 2 / 100),
        const Text2(
          title: "·",
        ),
        SizedBox(width: screenwidth * 2 / 100),
        Text2(
          title: date,
        ),
        SizedBox(width: screenwidth * 2 / 100),
        const Text2(
          title: "·",
        ),
        SizedBox(width: screenwidth * 2 / 100),
        Text2(
          title: time,
        ),
      ],
    );
  }
}
