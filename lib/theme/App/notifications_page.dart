//----------------------------------------------------------------------------//

// pagina dedicata esclusivamente dalle notifiche in-app

// è composta da una serie di container (eliminabili) contenenti il messaggio della notifica

//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// widgets
import 'package:dik/theme/App/Widgets/appbar.dart';

// colors
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: const MyAppBar(
          gobackbutton: true,
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: primaryBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: const NotificationItem(),
    );
  }
}

//----------------------------------------------------------------------------//

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: AspectRatio(
        aspectRatio: 100 / 30,
        child: GestureDetector(
          onTap: () {
            //Navigator.pushNamed();
          },
          child: Container(
            decoration: BoxDecoration(
              color: primaryObjColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//
