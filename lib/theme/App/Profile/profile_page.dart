//----------------------------------------------------------------------------//

// * qui viene creato il menu della pagina del profilo utente

//----------------------------------------------------------------------------//

//framework
import 'package:dik/Theme/Widgets/text2.dart';
import 'package:dik/Theme/Widgets/title2.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:dik/theme/Widgets/appbar.dart';
import 'package:dik/Theme/Widgets/profile_menu_item.dart';

// simulating-database
import 'package:dik/theme/DatabaseSamples/user_info.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// other pages
import 'package:dik/Theme/App/Profile/profile_picture_editing_page.dart';

// external extentions
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

//----------------------------------------------------------------------------//

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

//----------------------------------------------------------------------------//

class ProfilePageState extends State<ProfilePage> {
  Widget imageProfile() {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ProfilePictureEditingPage()),
      ),
      child: CircleAvatar(
        radius: screenheight * 7 / 100,
        backgroundImage: const AssetImage("assets/immagine di profilo.jpg"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

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
      body: Container(
        padding: EdgeInsets.all(screenwidth * 4 / 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageProfile(),
            SizedBox(height: screenheight * 1 / 100),
            Title2(title: username),
            SizedBox(height: screenheight * 1 / 100),
            Text2(title: email),
            const Spacer(
              flex: 4,
            ),
            //Menu
            ProfileMenuWidget(
              title: "Tickets",
              icon: LineAwesomeIcons.alternate_ticket,
              onPress: () {
                Navigator.pushNamed(context, '/tickets');
              },
              textColor: textColor,
            ),
            const Spacer(),
            ProfileMenuWidget(
              title: "Carrello",
              icon: Icons.shopping_cart_outlined,
              onPress: () {
                Navigator.pushNamed(context, '/cart');
              },
              textColor: textColor,
            ),
            const Spacer(),
            ProfileMenuWidget(
              title: "Impostazioni",
              icon: LineAwesomeIcons.cog,
              onPress: () {
                Navigator.pushNamed(context, '/settings');
              },
              textColor: textColor,
            ),
            const Spacer(),
            ProfileMenuWidget(
              title: "Privacy",
              icon: LineAwesomeIcons.lock,
              onPress: () {
                Navigator.pushNamed(context, '/privacy');
              },
              textColor: textColor,
            ),
            const Spacer(),
            ProfileMenuWidget(
              title: "Sicurezza",
              icon: LineAwesomeIcons.check_circle,
              onPress: () {},
              textColor: textColor,
            ),
            const Spacer(),
            ProfileMenuWidget(
              title: "Informazioni",
              icon: LineAwesomeIcons.info,
              onPress: () {
                Navigator.pushNamed(context, '/info');
              },
              textColor: textColor,
            ),
            const Spacer(),
            ProfileMenuWidget(
              title: "Crea Evento",
              icon: LineAwesomeIcons.plus_circle,
              onPress: () {
                Navigator.pushNamed(context, '/add_event');
              },
              textColor: textColor,
            ),
            const Spacer(),
            ProfileMenuWidget(
              title: "Esci",
              icon: LineAwesomeIcons.alternate_sign_out,
              onPress: () {},
              textColor: textColor,
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//
