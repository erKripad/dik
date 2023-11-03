//----------------------------------------------------------------------------//

// framework
import 'package:dik/Theme/App/Profile/profile_page.dart';
import 'package:flutter/material.dart';

//----------------------------------------------------------------------------//

class ProfileButton extends StatelessWidget {
  final double? iconSize;
  final String? image;

  const ProfileButton({
    Key? key,
    this.iconSize,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        //SizedBox(width: screenwidth * 3 / 100),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ProfilePage()),
          ),
          onLongPress: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ProfilePage()),
          ),
          child: SizedBox(
            width: iconSize ?? screenheight * 4 / 100,
            height: iconSize ?? screenheight * 4 / 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage(image ?? "assets/immagine di profilo.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(width: screenwidth * 4 / 100),
      ],
    );
  }
}
