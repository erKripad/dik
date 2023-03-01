//----------------------------------------------------------------------------//

import 'package:dik/profile_padding.dart';
import 'package:flutter/material.dart';

//----------------------------------------------------------------------------//

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text('erKripad'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Profile(),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.purple,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
//----------------------------------------------------------------------------//

