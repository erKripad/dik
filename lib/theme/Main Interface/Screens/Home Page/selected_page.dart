//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:dik/theme/Main Interface/appbar.dart';
import 'package:dik/theme/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';

//----------------------------------------------------------------------------//

class SelectedPage extends StatefulWidget {
  const SelectedPage({super.key});

  @override
  State<SelectedPage> createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> {
  static String image = "assets/prova1.jpg";

  PaletteGenerator? paletteGenerator;
  Color defaultColor = primaryObjColour;

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
        child: const MyAppBar(
          hype: true,
          gobackbutton: true,
        ),
      ),
      backgroundColor: primaryBackgroundColour,
      extendBodyBehindAppBar: true,
      body:
          // considero un bordo padding standard di 15 come nelle altre schede
          Container(
        padding: const EdgeInsets.all(0),
        // inizio a creare la pagina mettendo in colonna i diversi elementi
        child: SingleChildScrollView(
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
                            : paletteGenerator?.vibrantColor == null
                                ? paletteGenerator?.lightVibrantColor == null
                                    ? defaultColor
                                    : paletteGenerator
                                            ?.lightVibrantColor?.color ??
                                        defaultColor
                                : paletteGenerator?.vibrantColor?.color ??
                                    defaultColor,
                        //paletteGenerator?.vibrantColor?.color ?? defaultColor,
                        primaryBackgroundColour,
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
                        const SizedBox(
                          child: Text(
                            "Titolo",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "Gelion Bold",
                              fontSize: 30,
                              color: textColour,
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
          color: primaryObjColour,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: const Text(
          "descrizione",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: "Gelion Medium",
            fontSize: 14,
            color: textColour,
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
          color: primaryObjColour,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Info Servizi",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: 20,
                  color: primaryPurple,
                ),
              ),
            ),
            SizedBox(height: screenheight * 2 / 100),
            Row(
              children: [
                SvgPicture.asset(
                  CustomIcons.ticket,
                  height: 28,
                  width: 28,
                  color: iconColour,
                ),
                SizedBox(width: screenwidth * 2 / 100),
                const Text(
                  "Guardaroba",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: 18,
                    color: textColour,
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
                  color: iconColour,
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
                    color: textColour,
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
                  color: iconColour,
                ),
                SizedBox(width: screenwidth * 2 / 100),
                const Text(
                  "Ristoro",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Gelion Bold",
                    fontSize: 18,
                    color: textColour,
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
          color: primaryBackgroundColour,
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
                  color: iconColour,
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
                    color: textColour,
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
                  color: iconColour,
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
                    color: textColour,
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
                  color: iconColour,
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
                    color: textColour,
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
            color: primaryObjColour,
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
                    CustomIcons.ticket,
                    height: 50,
                    width: 50,
                    color: iconColour,
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
                      color: textColour,
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
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenwidth * 90 / 100 - 40,
      width: screenwidth * 95 / 100,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: primaryBackgroundColour,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              CustomIcons.ticket,
              height: 40,
              width: 40,
              color: iconColour,
            ),
            SizedBox(width: screenwidth * 5 / 100),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: primaryObjColour,
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
