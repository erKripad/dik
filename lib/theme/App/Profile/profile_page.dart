//----------------------------------------------------------------------------//

//framework
import 'package:flutter/material.dart';

// widgets
import 'package:dik/theme/App/Widgets/appbar.dart';

// simulating-database
import 'package:dik/theme/user_info.dart';

// colors
import 'package:dik/Theme/colors.dart';

// external extentions
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// unused extentions

//import 'package:dik/theme/icons.dart';
//import 'package:flutter_svg/flutter_svg.dart';

//----------------------------------------------------------------------------//

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
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
                style: const TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: 25,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: const TextStyle(
                  fontFamily: "Gelion Medium",
                  fontSize: 16,
                  color: textColor,
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
                textColor: textColor,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Carrello",
                icon: Icons.shopping_cart_outlined,
                onPress: () {
                  Navigator.pushNamed(context, '/cart');
                },
                textColor: textColor,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Impostazioni",
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Navigator.pushNamed(context, '/settings');
                },
                textColor: textColor,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Privacy",
                icon: LineAwesomeIcons.lock,
                onPress: () {
                  Navigator.pushNamed(context, '/privacy');
                },
                textColor: textColor,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Sicurezza",
                icon: LineAwesomeIcons.check_circle,
                onPress: () {},
                textColor: textColor,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Informazioni",
                icon: LineAwesomeIcons.info,
                onPress: () {
                  Navigator.pushNamed(context, '/info');
                },
                textColor: textColor,
              ),
              const SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Esci",
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {},
                textColor: textColor,
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
            color: primaryObjColor,
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
                color: primaryObjColor,
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: iconColor,
              ),
            )
          : null,
    );
  }
}

//----------------------------------------------------------------------------//
