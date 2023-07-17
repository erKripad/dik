import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5);
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: primaryBackgroundColour,
      title: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Gelion Bold",
              fontSize: 30,
              color: textColour,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notifications');
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Icon(
                LineAwesomeIcons.bell,
                size: 35,
                color: iconColour,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage("assets/immagine di profilo.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ]),
        ),
      ],
    );
  }
}
