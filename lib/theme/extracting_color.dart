/*import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:flutter/rendering.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:muego_dev2/models/songs.dart';
//import 'package:provider/provider.dart';

class ColorDetect extends StatefulWidget {
  //static const routeName = '/';

  @override
  _ColorDetectState createState() => _ColorDetectState();
}

class _ColorDetectState extends State<ColorDetect> {
  final coverData = "assets/papera.jpg";

  img.Image? photo;

  void setImageBytes(imageBytes) {
    print("setImageBytes");

    photo = null;
    photo = img.decodeImageFile("assets/papera.jpg") as img.Image?;
  }

  // image lib uses uses KML color format, convert #AABBGGRR to regular #AARRGGBB
  int abgrToArgb(int argbColor) {
    print("abgrToArgb");
    int r = (argbColor >> 16) & 0xFF;
    int b = argbColor & 0xFF;
    return (argbColor & 0xFF00FF00) | (b << 16) | r;
  }

  // FUNCTION

  Future<Color> _getColor() async {
    print("_getColor");
    Uint8List? data;

    try {
      data = (await NetworkAssetBundle(Uri.parse(coverData)).load(coverData))
          .buffer
          .asUint8List();
    } catch (ex) {
      print(ex.toString());
    }

    print("setImageBytes....");
    setImageBytes(data);

//FractionalOffset(1.0, 0.0); //represents the top right of the [Size].
    double px = 1.0;
    double py = 0.0;

    int pixel32 = photo?.getPixelSafe(px.toInt(), py.toInt()) as int;
    int hex = abgrToArgb(pixel32);
    print("Value of int: $hex ");

    return Color(hex);
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(coverData),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: FutureBuilder(
              future: _getColor(),
              builder: (_, AsyncSnapshot<Color> data) {
                if (data.connectionState == ConnectionState.done) {
                  return Container(
                    color: data.data,
                  );
                }
                return CircularProgressIndicator();
              }),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                elevation: 5.0,
                padding: EdgeInsets.all(15.0),
                color: Colors.grey,
                child: Text("Get Sizes"),
                onPressed: null,
              ),
              MaterialButton(
                elevation: 5.0,
                color: Colors.grey,
                padding: EdgeInsets.all(15.0),
                child: Text("Get Positions"),
                onPressed: _getColor,
              )
            ],
          ),
        )
      ],
    );
  }
}*/
