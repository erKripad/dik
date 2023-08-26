//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';
import 'package:dik/theme/Main Interface/appbar.dart';

//----------------------------------------------------------------------------//

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: const MyAppBar(
          gobackbutton: true,
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: primaryBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

//----------------------------------------------------------------------------//