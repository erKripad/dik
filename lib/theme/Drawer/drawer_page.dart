//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

//----------------------------------------------------------------------------//

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark
    var textColour = Colors.white;
    return Scaffold(
      backgroundColor: const Color.fromARGB(1, 25, 24, 28),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 55,
        elevation: 0,
        backgroundColor: Colors.transparent,
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
          /*decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Color.fromARGB(255, 140, 15, 161),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),*/
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(image: AssetImage("assets/papera.jpg")),
                ),
              ),
              const SizedBox(height: 10),
              Text("erKripad", style: Theme.of(context).textTheme.bodyLarge),
              Text(
                "erKripad@palle.com",
                style: TextStyle(color: textColour),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/edit_profile');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.1),
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 30),
              const Divider(color: Colors.white),
              const SizedBox(height: 10),

              //Menu
              ProfileMenuWidget(
                title: "Tickets",
                icon: LineAwesomeIcons.alternate_ticket,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                title: "Favorites",
                icon: LineAwesomeIcons.heart,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                title: "Cart",
                icon: Icons.abc,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
                textColor: Colors.white,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "Infopoint",
                icon: LineAwesomeIcons.info,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: Colors.white,
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                endIcon: false,
                onPress: () {
                  Navigator.pop(context);
                },
                textColor: Colors.red,
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
          color: Colors.black.withOpacity(0.1),
        ),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white.withOpacity(0.1),
          ),
          child: Icon(icon, color: textColor),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white.withOpacity(0.1),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}

//----------------------------------------------------------------------------//