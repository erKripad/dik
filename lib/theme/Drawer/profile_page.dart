//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark
    return Scaffold(
      backgroundColor: primaryBackgroundColour,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 55,
        elevation: 0,
        backgroundColor: primaryBackgroundColour,
      ),
      /*title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ), //Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],*/

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                      image: AssetImage("assets/immagine di profilo.jpg")),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "erKripad",
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: 25,
                  color: textColour,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "crippa@palle.com",
                style: TextStyle(
                  fontFamily: "Gelion Medium",
                  fontSize: 16,
                  color: textColour,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit_profile');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(color: primaryBackgroundColour),
                    )),
              ),
              const SizedBox(height: 40),

              //Menu
              ProfileMenuWidget(
                title: "Tickets",
                icon: LineAwesomeIcons.alternate_ticket,
                onPress: () {},
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Carrello",
                icon: Icons.shopping_cart_outlined,
                onPress: () {},
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Impostazioni",
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Privacy",
                icon: LineAwesomeIcons.lock,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Sicurezza",
                icon: LineAwesomeIcons.check_circle,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Informazioni",
                icon: LineAwesomeIcons.info,
                onPress: () {},
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Esci",
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {},
                textColor: textColour,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromARGB(255, 25, 24, 28),
        ),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: primaryObjColour,
          ),
          child: Icon(icon, color: textColor),
        ),
      ),
      title: Text(title,
          style: TextStyle(
            fontFamily: "Gelion Medium",
            fontSize: 18,
            color: textColor,
          )),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: primaryObjColour,
              ),
              child: Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: iconColour,
              ),
            )
          : null,
    );
  }
}

//----------------------------------------------------------------------------//