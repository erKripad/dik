//----------------------------------------------------------------------------//

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:dik/theme/Main Interface/appbar.dart';
import 'package:dik/theme/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

//----------------------------------------------------------------------------//

class SelectedPage extends StatelessWidget {
  const SelectedPage({super.key});
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
          Padding(
              padding: EdgeInsets.all(15),
              // inizio a creare la pagina mettendo in colonna i diversi elementi
              child: Column(
                children: [
                  SizedBox(height: screenheight * 4 / 100),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            height: screenwidth * 60 / 100,
                            width: screenwidth * 60 / 100,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Image(
                                  image: AssetImage("assets/papera.jpg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenheight * 2 / 100,
                        ),
                        SizedBox(
                          child: Text(
                            "Titolo",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "Gelion Bold",
                              fontSize: 26,
                              color: textColour,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenheight * 2 / 100,
                        ),
                        const DescriptionBox(),
                        SizedBox(
                          height: screenheight * 2 / 100,
                        ),
                        Row(
                          children: [
                            InfoBox(),
                            SizedBox(width: screenwidth * 4 / 100),
                            ServiceBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: const Text(
          "Servizi",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 18,
            color: textColour,
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

// costruisco il box con le Informazioni di Data e Ora, Luogo, Prezzo

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                Text(
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
                Text(
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
                Text(
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
