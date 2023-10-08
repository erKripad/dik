//----------------------------------------------------------------------------//

// framework
import 'package:dik/Theme/Widgets/text2.dart';
import 'package:dik/Theme/Widgets/title2.dart';
import 'package:flutter/material.dart';
import 'package:dik/theme/ModuleHandlers/image_picker.dart';
import 'package:dik/theme/ModuleHandlers/permission_handler.dart';

// colors
import 'package:dik/Theme/MaterialsUI/colors.dart';

// icons
import 'package:dik/theme/MaterialsUI/icons.dart';

// widgets
import 'package:dik/Theme/Widgets/appbar.dart';

// external extentions
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:flutter_svg/flutter_svg.dart';

//----------------------------------------------------------------------------//

class ProfilePictureEditingPage extends StatefulWidget {
  const ProfilePictureEditingPage({super.key});

  @override
  State<ProfilePictureEditingPage> createState() =>
      _ProfilePictureEditingPageState();
}

class _ProfilePictureEditingPageState extends State<ProfilePictureEditingPage>
  with TickerProviderStateMixin {
  
  Uint8List? _imageFile;

  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 800);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: const MyAppBar(
          gobackbutton: true,
          profile: false,
          notifications: false,
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: primaryBackgroundColor,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

      body: Column(
        children: [
          const Spacer(),
          _imageFile != null
              ? SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                      image: MemoryImage(_imageFile!), fit: BoxFit.fitWidth),
                )
              : const Image(
                  image: AssetImage("assets/immagine di profilo.jpg"),
                  fit: BoxFit.fill),
          SizedBox(
            height: screenheight * 5 / 100,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)),
                  transitionAnimationController: controller);
            },
            child: const Title2(
              title: "modifica",
              color: primaryPurple,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenheight * 20 / 100,
      decoration: BoxDecoration(
        color: primaryObjColor,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Column(
        children: [
          const Spacer(),
          const Title2(
            title: "Choose Profile Photo",
            color: primaryPurple,
          ),
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            GestureDetector(
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: screenheight * 4.5 / 100,
                      width: screenheight * 4.5 / 100,
                      child: SvgPicture.asset(
                        CustomIcons.camera,

                        // ignore: deprecated_member_use
                        color: iconColor,
                      ),
                    ),
                    SizedBox(width: screenwidth * 2 / 100),
                    const Text2(title: "camera"),
                  ],
                )),
            SizedBox(width: screenwidth * 30 / 100),
            GestureDetector(
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Row(
                  children: [
                    const Icon(Icons.image),
                    SizedBox(width: screenwidth * 2 / 100),
                    const Text2(title: "gallery"),
                  ],
                )),
          ]),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {

    bool valid = await permissionHandler(source);

    if(valid == false) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("This permission is recommended")));
      return;
    }

    Uint8List img = await imagePicker(source);

    setState(() {
      _imageFile = img;
    });
  
  }

}

//----------------------------------------------------------------------------//