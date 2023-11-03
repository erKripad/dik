//----------------------------------------------------------------------------//

// framework
import 'package:dik/Theme/Widgets/title1.dart';
import 'package:flutter/material.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// widgets
import 'package:dik/Theme/Widgets/appbar.dart';
import 'package:dik/Theme/Widgets/title2.dart';
import 'package:dik/Theme/Widgets/text2.dart';

// icons
import 'package:dik/theme/MaterialsUI/icons.dart';

// other pages
import 'package:dik/Theme/App/Screens/HomeScreen/host_page.dart';

// external extentions
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';

// simil-database
import 'package:dik/theme/DatabaseSamples/events_examples.dart';

//----------------------------------------------------------------------------//

class SelectedPage extends StatefulWidget {
  const SelectedPage({super.key});

  @override
  State<SelectedPage> createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> {
  PaletteGenerator? paletteGenerator;
  Color defaultColor = primaryBackgroundColor;

  void generateColors() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(image),
    );
    setState(() {});
  }

  @override
  void initState() {
    generateColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    Color itemColor = paletteGenerator?.dominantColor == null
        ? defaultColor
        : paletteGenerator?.dominantColor?.color ?? defaultColor;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: MyAppBar(
          hype: true,
          hypeColor:
              itemColor != primaryBackgroundColor ? iconColor : primaryPurple,
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
                /*decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [itemColor, primaryBackgroundColor],
                      stops: const [0.2, 1],
                      tileMode: TileMode.clamp),
                ),*/
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
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child:
                            Image(image: AssetImage(image), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight * 2 / 100,
                  ),
                  Title1(title: title),
                  SizedBox(
                    height: screenheight * 1 / 100,
                  ),
                  const Subbox(host: "host"),
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
                    ),
                    SizedBox(height: screenheight * 4 / 100),*/
                    const Title2(
                      title: "Info",
                      color: textColor,
                    ),
                    SizedBox(height: screenheight * 2 / 100),
                    const InfoBox(),
                    SizedBox(height: screenheight * 4 / 100),
                    const Title2(
                      title: "Service",
                      color: textColor,
                    ),
                    SizedBox(height: screenheight * 2 / 100),
                    const ServiceBox(
                      titleColor: textColor,
                    ),
                    SizedBox(height: screenheight * 4 / 100),
                    const Title2(
                      title: "Maps",
                      color: textColor,
                    ),
                    SizedBox(height: screenheight * 2 / 100),
                    const MapBox(),
                    const Title2(
                      title: "Host",
                      color: textColor,
                    ),
                    SizedBox(height: screenheight * 2 / 100),
                    const HostInfoBox(
                      hostImage: "assets/papera.jpg",
                      telephone: "+39 420 6969",
                      website: "https://sitobello.it",
                      opened: true,
                    ),
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
                    const Title2(
                      title: "Similar Events",
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

class HostingEventProfileButton extends StatefulWidget {
  const HostingEventProfileButton({
    super.key,
    required this.size,
    required this.hostImage,
  });

  final double size;
  final String hostImage;

  @override
  State<HostingEventProfileButton> createState() =>
      _HostingEventProfileButtonState();
}

class _HostingEventProfileButtonState extends State<HostingEventProfileButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HostPage(
              host: "Host",
            ),
          ),
        );
      },
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image(
            image: AssetImage(widget.hostImage),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class Subbox extends StatefulWidget {
  const Subbox({
    super.key,
    required this.host,
  });

  final String host;
  @override
  State<StatefulWidget> createState() => SubboxState();
}

class SubboxState extends State<Subbox> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenheight * 5 / 100,
      width: screenwidth * 95 / 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HostingEventProfileButton(
            size: screenheight * 4 / 100,
            hostImage: "assets/concerto.jpeg",
          ),
          SizedBox(width: screenwidth * 3 / 100),
          const Text2(
            title: "host",
            bold: true,
          )
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------//

// costruisco il box della Descrizione che si trova direttamente sotto il titolo

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
            color: widget.titleColor,
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

// costruisco il box dei Servizi

class ServiceBox extends StatelessWidget {
  const ServiceBox({super.key, this.titleColor});
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    //double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.fromLTRB(
        screenheight * 3 / 100,
        screenheight * 1 / 100,
        screenheight * 3 / 100,
        screenheight * 1 / 100,
      ),
      decoration: BoxDecoration(
        color: primaryObjColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowItem(icon: CustomIcons.appendiabiti, title: "Wardrobe"),
          RowItem(icon: CustomIcons.pet, title: "Pet Friendly"),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------//

// costruisco il box con le Informazioni di Data e Ora, Luogo, Prezzo

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    //double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.fromLTRB(
        screenheight * 3 / 100,
        screenheight * 1 / 100,
        screenheight * 3 / 100,
        screenheight * 1 / 100,
      ),
      decoration: BoxDecoration(
        color: primaryObjColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowItem(icon: CustomIcons.disco, title: "Event"),
          RowItem(icon: CustomIcons.empty_calendar, title: "Date"),
          RowItem(icon: CustomIcons.empty_calendar, title: "Time"),
          RowItem(icon: CustomIcons.map_pin_2, title: "Place"),
          RowItem(icon: CustomIcons.ticket, title: "Price"),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class HostInfoBox extends StatelessWidget {
  const HostInfoBox({
    super.key,
    required this.hostImage,
    required this.telephone,
    required this.website,
    required this.opened,
  });

  final String hostImage;
  final String telephone;
  final String website;
  final bool opened;

  @override
  Widget build(context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image(image: AssetImage(hostImage), fit: BoxFit.fill),
          ),
        ),
        SizedBox(width: screenwidth * 4 / 100),
        Container(
          width: screenwidth * 60 / 100,
          padding: EdgeInsets.fromLTRB(
            screenheight * 3 / 100,
            screenheight * 1 / 100,
            screenheight * 3 / 100,
            screenheight * 1 / 100,
          ),
          decoration: BoxDecoration(
            color: primaryObjColor,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text2(
              title: opened == true ? "Aperto" : "Chiuso",
            ),
            SizedBox(height: screenheight * 1 / 100),
            const Text2(
              title: "Telephone",
            ),
            Text2(
              size: screenheight * 2 / 100,
              title: telephone,
            ),
            SizedBox(height: screenheight * 1 / 100),
            const Text2(
              title: "Website",
            ),
            Text2(
              size: screenheight * 2 / 100,
              title: website,
            ),
          ]),
        )
      ],
    );
  }
}

//----------------------------------------------------------------------------//

class MapBox extends StatelessWidget {
  const MapBox({super.key});
  @override
  Widget build(context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/');
      },
      child: Container(
        height: screenwidth * 90 / 100 - 40,
        width: screenwidth * 95 / 100,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: primaryBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenheight * 3.5 / 100,
                  width: screenheight * 3.5 / 100,
                  child: SvgPicture.asset(
                    CustomIcons.map_pin,

                    // ignore: deprecated_member_use
                    color: iconColor,
                  ),
                ),
              ],
            ),
            SizedBox(width: screenwidth * 5 / 100),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primaryObjColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.icon,
    required this.title,
    this.color,
    this.iconSize,
    this.textSize,
  });

  final String icon;
  final String title;
  final double? iconSize;
  final double? textSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Column(children: [
      SizedBox(height: screenheight * 1 / 100),
      Row(
        children: [
          SizedBox(
            height: iconSize ?? screenheight * 3.5 / 100,
            width: iconSize ?? screenheight * 3.5 / 100,
            child: SvgPicture.asset(
              icon,

              // ignore: deprecated_member_use
              color: color ?? iconColor,
            ),
          ),
          SizedBox(width: screenwidth * 4 / 100),
          Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: "Gelion Bold",
              fontSize: textSize ?? screenheight * 2.5 / 100,
              color: color ?? textColor,
            ),
          ),
        ],
      ),
      SizedBox(height: screenheight * 1 / 100),
    ]);
  }
}

//----------------------------------------------------------------------------//
