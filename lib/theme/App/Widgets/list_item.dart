//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// widgets
import 'package:dik/Theme/App/Widgets/buttons.dart';
import 'package:dik/Theme/App/selected_page.dart';

// colors
import 'package:dik/Theme/colors.dart';

// simil-database
import 'package:dik/Theme/events_examples.dart';

// external extentions
import 'package:flutter_svg/flutter_svg.dart';

//----------------------------------------------------------------------------//

class ListItem extends StatefulWidget {
  const ListItem({
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

  //final String onTapDestination;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  _getRequests() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    int price = widget.price;
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
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
                height: screenwidth * 120 / 100,
                decoration: BoxDecoration(
                  color: primaryObjColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                padding: EdgeInsets.all(screenwidth * 3 / 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenwidth * 88 / 100,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Image(
                            image: AssetImage(widget.image), fit: BoxFit.fill),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "Gelion Bold",
                            fontSize: screenheight * 3 / 100,
                            color: primaryPurple,
                          ),
                        ),
                        SizedBox(
                          height: screenwidth * 10 / 100,
                          width: screenwidth * 14 / 100,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: ColoredBox(
                                color: primaryBackgroundColor,
                                child: Center(
                                  child: Text(
                                    "$price\$",
                                    style: const TextStyle(
                                      fontFamily: "Gelion Medium",
                                      fontSize: 18,
                                      color: primaryPurple,
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EventInfo(
                            category: widget.category,
                            date: widget.date,
                            time: widget.time),
                        Container(
                          height: screenwidth * 10 / 100,
                          width: screenwidth * 14 / 100,
                          decoration: const BoxDecoration(
                            color: primaryBackgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: ButtonHype(
                            hyped: hyped,
                            selectedColor: primaryPurple,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: screenheight * 2 / 100,
      )
    ]);
  }
}

//----------------------------------------------------------------------------//

class EventInfo extends StatelessWidget {
  const EventInfo({
    super.key,
    required this.category,
    required this.date,
    required this.time,
  });

  final String category;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SvgPicture.asset(
          category,
          height: screenheight * 4 / 100,
          width: screenheight * 4 / 100,
          // ignore: deprecated_member_use
          color: iconColor,
        ),
        SizedBox(width: screenwidth * 2 / 100),
        const Text(
          "·",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 18,
            color: textColor,
          ),
        ),
        SizedBox(width: screenwidth * 2 / 100),
        Text(
          date,
          style: const TextStyle(
            fontFamily: "Gelion Medium",
            fontSize: 18,
            color: textColor,
          ),
        ),
        SizedBox(width: screenwidth * 2 / 100),
        const Text(
          "·",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 18,
            color: textColor,
          ),
        ),
        SizedBox(width: screenwidth * 2 / 100),
        Text(
          time,
          style: const TextStyle(
            fontFamily: "Gelion Medium",
            fontSize: 18,
            color: textColor,
          ),
        ),
      ],
    );
  }
}

//----------------------------------------------------------------------------//
