//----------------------------------------------------------------------------//

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
          physics: BouncingScrollPhysics(
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
                          height: screenheight * 8 / 100,
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
                            style: const TextStyle(
                              fontFamily: "Gelion Bold",
                              fontSize: 30,
                              color: textColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenheight * 1 / 100,
                        ),
                      ],
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const DescriptionBox(),
                      SizedBox(
                        height: screenheight * 2 / 100,
                      ),
                      Row(
                        children: [
                          const InfoBox(),
                          SizedBox(width: screenwidth * 4 / 100),
                          const ServiceBox(),
                        ],
                      ),
                      SizedBox(
                        height: screenheight * 2 / 100,
                      ),
                      const HostInfoBox(),
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
  const HostingEventProfileButton({super.key});

  @override
  State<HostingEventProfileButton> createState() =>
      _HostingEventProfileButtonState();
}

class _HostingEventProfileButtonState extends State<HostingEventProfileButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/profile');
      },
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 50,
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: const Image(
            image: AssetImage("assets/immagine di profilo.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

// costruisco il box della Descrizione che si trova direttamente sotto il titolo

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenheight * 20 / 100,
      width: screenwidth * 95 / 100,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: primaryObjColor,
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
  Widget build(context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenheight * 25 / 100,
      width: screenwidth * 44 / 100,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: primaryObjColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*const Center(
              child: Text(
                "Info Servizi",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: 20,
                  color: primaryPurple,
                ),
              ),
            ),*/
            SizedBox(height: screenheight * 2 / 100),
            Row(
              children: [
                SvgPicture.asset(
                  CustomIcons.appendiabiti,
                  height: 32,
                  width: 32,
                  // ignore: deprecated_member_use
                  color: iconColor,
                ),
                SizedBox(width: screenwidth * 2 / 100),
                const Text(
                  "Guardaroba",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenheight * 2 / 100),
            Row(
              children: [
                SvgPicture.asset(
                  CustomIcons.ticket,
                  height: 36,
                  width: 36,
                  // ignore: deprecated_member_use
                  color: iconColor,
                ),
                SizedBox(
                  width: screenwidth * 2 / 100,
                ),
                const Text(
                  "WC",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenheight * 2 / 100),
            Row(
              children: [
                SvgPicture.asset(
                  CustomIcons.ticket,
                  height: 28,
                  width: 28,
                  // ignore: deprecated_member_use
                  color: iconColor,
                ),
                SizedBox(width: screenwidth * 2 / 100),
                const Text(
                  "Ristoro",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

// costruisco il box con le Informazioni di Data e Ora, Luogo, Prezzo

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});
  @override
  Widget build(context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenheight * 25 / 100,
      width: screenwidth * 44 / 100,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: primaryBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  CustomIcons.empty_calendar,
                  height: 24,
                  width: 24,
                  // ignore: deprecated_member_use
                  color: iconColor,
                ),
                SizedBox(
                  width: screenwidth * 2 / 100,
                ),
                const Text(
                  "Data e Ora",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenheight * 5 / 100,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  CustomIcons.empty_calendar,
                  height: 24,
                  width: 24,
                  // ignore: deprecated_member_use
                  color: iconColor,
                ),
                SizedBox(
                  width: screenwidth * 2 / 100,
                ),
                const Text(
                  "Luogo",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenheight * 5 / 100,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  CustomIcons.ticket,
                  height: 28,
                  width: 28,
                  // ignore: deprecated_member_use
                  color: iconColor,
                ),
                SizedBox(
                  width: screenwidth * 2 / 100,
                ),
                const Text(
                  "Costo",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
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
          decoration: const BoxDecoration(
            color: primaryObjColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              SizedBox(width: screenwidth * 5 / 100),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HostingEventProfileButton(),
                  SizedBox(height: screenheight * 2 / 100),
                  SvgPicture.asset(
                    CustomIcons.trattore,
                    height: 50,
                    width: 50,
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
    return SizedBox(
      height: screenwidth * 90 / 100 - 40,
      width: screenwidth * 95 / 100,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: primaryBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*SvgPicture.asset(
              CustomIcons.ticket,
              height: 40,
              width: 40,
              // ignore: deprecated_member_use
              color: iconColor,
            ),*/
            const Icon(
              LineAwesomeIcons.map_marked,
              size: 40,
            ),
            SizedBox(width: screenwidth * 5 / 100),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: primaryObjColor,
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
