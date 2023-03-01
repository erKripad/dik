import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlurryContainer(
        color: Colors.black,
        blur: 8,
        elevation: 1,
        height: 240,
        padding: const EdgeInsets.all(32),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple,
              backgroundImage: NetworkImage(
                  'https://img.indiaforums.com/person/480x360/0/0211-hrithik-roshan.jpg?c=4lP5F3'),
            ),
            const Spacer(),
            const Text(
              "0000 0000 0000 0000",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Ranjeet Rocky".toUpperCase(),
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    // fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const Spacer(),
                Text(
                  "VALID",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
