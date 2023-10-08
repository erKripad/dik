// framework
import 'package:dik/theme/App/Profile/image_crop.dart';

// external extentions
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

Future<Uint8List> imagePicker(ImageSource source) async {

  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);

  if(source == ImageSource.gallery) {
    file = await imageCrop(imageFile: file);
  }
    
  Uint8List img = await file!.readAsBytes();
  return img;

}