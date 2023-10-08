
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> permissionHandler(ImageSource type) async {

  PermissionStatus? status;
 
  if(type == ImageSource.camera) {
    status = await Permission.camera.request();
  }

  if(type == ImageSource.gallery) {
    status = await Permission.photos.request();
  }

  if(status == PermissionStatus.granted) {
    return true;
  }

  if(status == PermissionStatus.denied) {

    var context;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("This permission is recommended")));
    return false;
  }

  if(status == PermissionStatus.permanentlyDenied) {
    openAppSettings();
    return false;
  }

  return false;
} 