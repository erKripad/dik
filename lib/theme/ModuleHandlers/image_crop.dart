  
// external extentions
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

Future<XFile?> imageCrop({required XFile? imageFile}) async {
  CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile!.path);
  if (croppedImage == null) return null;
  return XFile(croppedImage.path);
}