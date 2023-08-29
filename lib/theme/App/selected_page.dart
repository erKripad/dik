//----------------------------------------------------------------------------//

import 'package:dik/Theme/App/main_interface.dart';
import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:dik/Theme/App/appbar.dart';
import 'package:dik/theme/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:dik/theme/events_examples.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

//----------------------------------------------------------------------------//

class SelectedPage extends StatefulWidget {
  const SelectedPage({super.key});

  @override
  State<SelectedPage> createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> {
  PaletteGenerator? paletteGenerator;
  Color defaultColor = primaryObjColor;

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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: MyAppBar(
          hype: true,
          hypeColor: paletteGenerator == null
              ? defaultColor
              : paletteGenerator?.dominantColor == null
                  ? paletteGenerator?.lightVibrantColor == null
                      ? defaultColor
                      : paletteGenerator?.lightVibrantColor?.color ??
                          defaultColor
                  : paletteGenerator?.dominantColor?.color.withOpacity(1) ??
                      defaultColor,
          gobackbutton: true,
        ),
      ),
      backgroundColor: primaryBackgroundColor,
      extendBodyBehindAppBar: true,
      body:
          // considero un bordo padding standard di 15 come nelle altre schede
          Container(
        padding: const EdgeInsets.all(0),
        // inizio a creare la pagina mettendo in colonna i diversi elementi
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        paletteGenerator == null
                            ? defaultColor
                            : paletteGenerator?.dominantColor == null
                                ? paletteGenerator?.lightVibrantColor == null
                                    ? defaultColor
                                    : paletteGenerator?.lightVibrantColor?.color
                                            .withOpacity(1) ??
                                        defaultColor
                                : paletteGenerator?.dominantColor?.color
                                        .withOpacity(1) ??
                                    defaultColor,
                        //paletteGenerator?.vibrantColor?.color ?? defaultColor,

                        primaryBackgroundColor,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
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
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image(
                                  image: AssetImage(image), fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenheight * 2 / 100,
                        ),
                        SizedBox(
                          child: Text(
                            title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "Gelion Bold",
                              fontSize: screenheight * 4.4 / 100,
                              color: textColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenheight * 1 / 100,
                        ),
                        const Subbox(host: "host"),
                      ],
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      DescriptionBox(
                        initialHeight: screenheight * 6 / 100,
                        finallHeight: screenheight * 30 / 100,
                      ),
                      SizedBox(
                        height: screenheight * 2 / 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const InfoBox(),
                          const ServiceBox(),
                        ],
                      ),
                      SizedBox(
                        height: screenheight * 2 / 100,
                      ),
                      //const HostInfoBox(),
                      SizedBox(
                        height: screenheight * 2 / 100,
                      ),
                      const MapBox(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class HostingEventProfileButton extends StatefulWidget {
  const HostingEventProfileButton(
      {super.key,
      required this.size,
      required this.hostImage,
      required this.navigationTo});

  final double size;
  final String hostImage;
  final String navigationTo;

  @override
  State<HostingEventProfileButton> createState() =>
      _HostingEventProfileButtonState();
}

class _HostingEventProfileButtonState extends State<HostingEventProfileButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.navigationTo);
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
            navigationTo: '/profile',
            size: screenheight * 4 / 100,
            hostImage: "assets/papera.jpg",
          ),
          SizedBox(width: screenwidth * 3 / 100),
          Text(
            widget.host,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: "Gelion Bold",
              fontSize: screenheight * 2.2 / 100,
              color: textColor,
            ),
          ),
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
  });

  final double initialHeight;
  final double finallHeight;

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
        //colorContainer = primaryObjColor.withOpacity(1);
      }
    });
  }

  double _descriptionBoxHeight = 50;

  bool clicked = false;

  Color colorContainer = primaryObjColor.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => clicked == true
          ? _descriptionBoxAnimation(50)
          : _descriptionBoxAnimation(widget.finallHeight),
      child: AnimatedContainer(
        height: _descriptionBoxHeight,
        width: screenwidth * 95 / 100,
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colorContainer,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: const Text(
          "descrizione",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: "Gelion Medium",
            fontSize: 14,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

// costruisco il box dei Servizi

class ServiceBox extends StatelessWidget {
  const ServiceBox({super.key});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenheight * 25 / 100,
      width: screenwidth * 45 / 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: primaryObjColor.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screenwidth * 1 / 100),
              SvgPicture.asset(
                CustomIcons.appendiabiti,
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
                // ignore: deprecated_member_use
                color: iconColor,
              ),
              SizedBox(width: screenheight * 0.5 / 100),
              /*SvgPicture.asset(
                CustomIcons.empty_calendar,
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
                // ignore: deprecated_member_use
                color: iconColor,
              ),*/
              SizedBox(
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
              ),
              SizedBox(width: screenheight * 0.5 / 100),
              /*SvgPicture.asset(
                CustomIcons.ticket,
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
                // ignore: deprecated_member_use
                color: iconColor,
              ),*/
              SizedBox(
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
              ),
              SizedBox(width: screenheight * 0.5 / 100),
            ],
          ),
          SizedBox(width: screenwidth * 1 / 100),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screenheight * 0.5 / 100),
              Text(
                "Wardrobe",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: screenheight * 2.5 / 100,
                  color: textColor,
                ),
              ),
              SizedBox(width: screenheight * 0.5 / 100),
              Text(
                "WC",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: screenheight * 2.5 / 100,
                  color: textColor,
                ),
              ),
              SizedBox(width: screenheight * 0.5 / 100),
              Text(
                "Bar",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: screenheight * 2.5 / 100,
                  color: textColor,
                ),
              ),
              SizedBox(width: screenheight * 0.5 / 100),
            ],
          ),
          SizedBox(width: screenwidth * 1 / 100),
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
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenheight * 30 / 100,
      width: screenwidth * 45 / 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: primaryObjColor.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                CustomIcons.disco,
                height: screenheight * 4 / 100,
                width: screenheight * 4 / 100,
                // ignore: deprecated_member_use
                color: iconColor,
              ),
              SvgPicture.asset(
                CustomIcons.empty_calendar,
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
                // ignore: deprecated_member_use
                color: iconColor,
              ),

              /*SvgPicture.asset(
                CustomIcons.empty_calendar,
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
                // ignore: deprecated_member_use
                color: iconColor,
              ),*/
              SizedBox(
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
              ),

              /*SvgPicture.asset(
                CustomIcons.ticket,
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
                // ignore: deprecated_member_use
                color: iconColor,
              ),*/
              SizedBox(
                height: screenheight * 3 / 100,
                width: screenheight * 3 / 100,
              ),
            ],
          ),
          SizedBox(width: screenwidth * 1 / 100),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Disco",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: screenheight * 2.5 / 100,
                  color: textColor,
                ),
              ),
              Text(
                "Data e Ora",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: screenheight * 2.5 / 100,
                  color: textColor,
                ),
              ),
              Text(
                "Luogo",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: screenheight * 2.5 / 100,
                  color: textColor,
                ),
              ),
              Text(
                "Costo",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: screenheight * 2.5 / 100,
                  color: textColor,
                ),
              ),
            ],
          ),
          SizedBox(width: screenwidth * 1 / 100),
        ],
      ),
    );
  }
}

class HostInfoBox extends StatelessWidget {
  const HostInfoBox({super.key});
  @override
  Widget build(context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenheight * 20 / 100,
      width: screenwidth * 95 / 100,
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: primaryObjColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              SizedBox(width: screenwidth * 5 / 100),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HostingEventProfileButton(
                    navigationTo: '/profile',
                    size: screenheight * 6 / 100,
                    hostImage: "assets/papera.jpg",
                  ),
                  SizedBox(height: screenheight * 2 / 100),
                  SvgPicture.asset(
                    CustomIcons.trattore,
                    height: screenheight * 3 / 100,
                    width: screenheight * 3 / 100,
                    // ignore: deprecated_member_use
                    color: iconColor,
                  ),
                ],
              ),
              SizedBox(width: screenwidth * 10 / 100),
              Column(
                children: [
                  SizedBox(height: screenheight * 1 / 100),
                  const Text(
                    "Descrizione Locale",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: "Gelion Bold",
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class MapBox extends StatelessWidget {
  const MapBox({super.key});
  @override
  Widget build(context) {
    //double screenheight = MediaQuery.of(context).size.height;
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
            const Icon(
              LineAwesomeIcons.map_marked,
              size: 40,
            ),
            SizedBox(width: screenwidth * 5 / 100),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primaryObjColor.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
