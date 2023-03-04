import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.center,
        color: Colors.purple,
        height: 1000,
        width: 500,
        padding: const EdgeInsets.all(32),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 200,
              backgroundColor: Colors.yellow,
            ),
            const Spacer(
              flex: 1,
            ),
            const Text(
              "erKripad",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            const Text(
              "bio",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                //fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Dikorp".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    // fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const Spacer(),
                const Text(
                  "VALID",
                  style: TextStyle(
                    color: Colors.white,
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
