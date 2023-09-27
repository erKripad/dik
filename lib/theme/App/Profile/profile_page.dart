//----------------------------------------------------------------------------//

//framework
import 'package:flutter/material.dart';

// widgets
import 'package:dik/theme/Widgets/appbar.dart';

// simulating-database
import 'package:dik/theme/DatabaseSamples/user_info.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// external extentions
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:image_cropper/image_cropper.dart';

//----------------------------------------------------------------------------//

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  Uint8List? _imageFile;

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        _imageFile != null
            ? CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(_imageFile!),
              )
            : CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage("assets/immagine di profilo.jpg"),
              ),
        Positioned(
          bottom: 0.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet(context)),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: MyAppBar(
          gobackbutton: true,
          profile: false,
          notifications: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageProfile(),

              SizedBox(height: 10),
              Text(
                username,
                style: const TextStyle(
                  fontFamily: "Gelion Bold",
                  fontSize: 25,
                  color: textColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                email,
                style: const TextStyle(
                  fontFamily: "Gelion Medium",
                  fontSize: 16,
                  color: textColor,
                ),
              ),
              SizedBox(height: 20),
              /*SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit_profile');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "Modifica Profilo",
                      style: TextStyle(color: primaryBackgroundColour),
                    )),
              ),*/
              SizedBox(height: 20),

              //Menu
              ProfileMenuWidget(
                title: "Tickets",
                icon: LineAwesomeIcons.alternate_ticket,
                onPress: () {
                  Navigator.pushNamed(context, '/tickets');
                },
                textColor: textColor,
              ),
              SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Carrello",
                icon: Icons.shopping_cart_outlined,
                onPress: () {
                  Navigator.pushNamed(context, '/cart');
                },
                textColor: textColor,
              ),
              SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Impostazioni",
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Navigator.pushNamed(context, '/settings');
                },
                textColor: textColor,
              ),
              SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Privacy",
                icon: LineAwesomeIcons.lock,
                onPress: () {
                  Navigator.pushNamed(context, '/privacy');
                },
                textColor: textColor,
              ),
              SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Sicurezza",
                icon: LineAwesomeIcons.check_circle,
                onPress: () {},
                textColor: textColor,
              ),
              SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Informazioni",
                icon: LineAwesomeIcons.info,
                onPress: () {
                  Navigator.pushNamed(context, '/info');
                },
                textColor: textColor,
              ),
              SizedBox(height: 8),
              ProfileMenuWidget(
                title: "Crea Evento",
                icon: LineAwesomeIcons.info,
                onPress: () {
                  Navigator.pushNamed(context, '/new_event');
                },
                textColor: textColor,
              ),
              SizedBox(height: 8),
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

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  Future<XFile?> _cropImage({required XFile? imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile!.path);
    if (croppedImage == null) return null;
    return XFile(croppedImage.path);
  }

  void takePhoto(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (source == ImageSource.gallery) {
      _file = await _cropImage(imageFile: _file);
    }

    Uint8List img = await _file!.readAsBytes();
    setState(() {
      _imageFile = img;
    });
  }
}

//----------------------------------------------------------------------------//

class ProfileMenuWidget extends StatelessWidget {
  ProfileMenuWidget({
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
          color: Color.fromARGB(255, 25, 24, 28),
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
