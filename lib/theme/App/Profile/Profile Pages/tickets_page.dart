//----------------------------------------------------------------------------//

// framework
import 'package:flutter/material.dart';

// widgets
import 'package:dik/theme/App/Widgets/appbar.dart';

// colors
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    //double screenwidth = MediaQuery.of(context).size.width;
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