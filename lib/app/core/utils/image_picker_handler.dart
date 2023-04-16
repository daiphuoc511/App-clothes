// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'image_picker_dialog.dart';

// class ImagePickerHandler {
//   ImagePickerDialog imagePicker;
//   AnimationController _controller;
//   ImagePickerListener _listener;

//   ImagePickerHandler(this._listener, this._controller);

//   openCamera() async {
//     imagePicker.dismissDialog();
//     XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image != null && image.path != null) {
//       File rotatedImage =
//           await FlutterExifRotation.rotateImage(path: image.path);
//       _listener.userImage(rotatedImage);
//     }
//   }

//   openGallery() async {
//     imagePicker.dismissDialog();
//     var image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null && image.path != null) {
//       File rotatedImage =
//           await FlutterExifRotation.rotateImage(path: image.path);
//       _listener.userImage(rotatedImage);
//     }
//   }

//   void init() {
//     imagePicker = new ImagePickerDialog(this, _controller);
//     imagePicker.initState();
//   }

//   // Future cropImage(XFile image) async {
//   //   CroppedFile croppedFile = await ImageCropper().cropImage(
//   //     sourcePath: image.path,
//   //     // ratioX: 1.0,
//   //     // ratioY: 1.0,
//   //     maxWidth: 512,
//   //     maxHeight: 512,
//   //   );
//   //   _listener.userImage(croppedFile);
//   // }

//   showDialog(BuildContext context) {
//     imagePicker.getImage(context);
//   }
// }

// abstract class ImagePickerListener {
//   userImage(File _image);
// }
