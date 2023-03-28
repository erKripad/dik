//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';

//----------------------------------------------------------------------------//

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Settings"),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

//----------------------------------------------------------------------------//