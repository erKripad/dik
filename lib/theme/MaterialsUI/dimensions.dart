//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';

//----------------------------------------------------------------------------//

double? screenwidth;
double? screenheight;

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize `screenWidth` and `screenHeight` only if they haven't
    // already been set.
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;

    return const SizedBox();
  }
}

//----------------------------------------------------------------------------//