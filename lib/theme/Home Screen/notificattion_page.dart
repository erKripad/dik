//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';

//----------------------------------------------------------------------------//

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Notifications"),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

//----------------------------------------------------------------------------//