//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';

//----------------------------------------------------------------------------//

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Saved"),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
    );
  }
}

//----------------------------------------------------------------------------//