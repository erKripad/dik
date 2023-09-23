//----------------------------------------------------------------------------//

import 'package:dik/theme/Main%20Interface/appbar.dart';
import 'package:dik/theme/user_info.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryBackgroundColour,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: const MyAppBar(
          gobackbutton: true,
          profile: false,
          notifications: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit_profile_picture');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                        image: AssetImage("assets/immagine di profilo.jpg")),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Text(
                username,
                style: TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: 25,
                  color: textColour,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: TextStyle(
                  fontFamily: "Gelion Medium",
                  fontSize: 16,
                  color: textColour,
                ),
              ),
              const SizedBox(height: 20),
              /*SizedBox(
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
                      "Modifica Profilo",
                      style: TextStyle(color: primaryBackgroundColour),
                    )),
              ),*/
              const SizedBox(height: 20),

              //Menu
              ProfileMenuWidget(
                title: "Tickets",
                icon: LineAwesomeIcons.alternate_ticket,
                onPress: () {
                  Navigator.pushNamed(context, '/tickets');
                },
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Carrello",
                icon: Icons.shopping_cart_outlined,
                onPress: () {
                  Navigator.pushNamed(context, '/cart');
                },
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Impostazioni",
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Navigator.pushNamed(context, '/settings');
                },
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Privacy",
                icon: LineAwesomeIcons.lock,
                onPress: () {
                  Navigator.pushNamed(context, '/privacy');
                },
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Sicurezza",
                icon: LineAwesomeIcons.check_circle,
                onPress: () {},
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Informazioni",
                icon: LineAwesomeIcons.info,
                onPress: () {
                  Navigator.pushNamed(context, '/info');
                },
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Crea Evento",
                icon: LineAwesomeIcons.info,
                onPress: () {
                  Navigator.pushNamed(context, '/new_event');
                },
                textColor: textColour,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Crea Evento2",
                icon: LineAwesomeIcons.info,
                onPress: () {
                  Navigator.pushNamed(context, '/new_event2');
                },
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