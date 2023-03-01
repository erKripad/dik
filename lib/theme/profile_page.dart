//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/profile_padding.dart';

//----------------------------------------------------------------------------//

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Profile(),
    );
  }
}

//----------------------------------------------------------------------------//