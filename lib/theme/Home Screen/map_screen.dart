//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';

//----------------------------------------------------------------------------//

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Map"),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
    );
  }
}

//----------------------------------------------------------------------------//