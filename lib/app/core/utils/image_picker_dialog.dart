// // ignore_for_file: use_key_in_widget_constructors

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'image_picker_handler.dart';

// class ImagePickerDialog extends StatelessWidget {
//   ImagePickerHandler _listener;
//   AnimationController _controller;
//   BuildContext context;

//   ImagePickerDialog(this._listener, this._controller);

//   Animation<double> _drawerContentsOpacity;
//   Animation<Offset> _drawerDetailsPosition;

//   void initState() {
//     _drawerContentsOpacity = new CurvedAnimation(
//       parent: new ReverseAnimation(_controller),
//       curve: Curves.fastOutSlowIn,
//     );
//     _drawerDetailsPosition = new Tween<Offset>(
//       begin: const Offset(0.0, 1.0),
//       end: Offset.zero,
//     ).animate(new CurvedAnimation(
//       parent: _controller,
//       curve: Curves.fastOutSlowIn,
//     ));
//   }

//   getImage(BuildContext context) {
//     if (_controller == null ||
//         _drawerDetailsPosition == null ||
//         _drawerContentsOpacity == null) {
//       return;
//     }
//     _controller.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) => new SlideTransition(
//         position: _drawerDetailsPosition,
//         child: new FadeTransition(
//           opacity: new ReverseAnimation(_drawerContentsOpacity),
//           child: this,
//         ),
//       ),
//     );
//   }

//   void dispose() {
//     _controller.dispose();
//   }

//   startTime() async {
//     var _duration = new Duration(milliseconds: 200);
//     return new Timer(_duration, navigationPage);
//   }

//   void navigationPage() {
//     Navigator.pop(context);
//   }

//   dismissDialog() {
//     _controller.reverse();
//     startTime();
//   }

//   @override
//   Widget build(BuildContext context) {
//     this.context = context;
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         Expanded(
//           flex: 1,
//           child: Container(),
//         ),
//         Container(
//           color: Theme.of(context).bottomAppBarColor,
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: <Widget>[
//               //TODO: Camera enabled

//               Theme(
//                 data: Theme.of(context).copyWith(
//                     buttonTheme: ButtonThemeData(
//                   minWidth: double.infinity,
//                   height: 40,
//                 )),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: Theme.of(context).buttonColor),
//                   onPressed: () {
//                     _listener.openCamera();
//                   },
//                   child: Text('camera'),
//                 ),
//               ),

//               SizedBox(
//                 height: 10,
//               ),
//               Theme(
//                 data: Theme.of(context).copyWith(
//                     buttonTheme: ButtonThemeData(
//                   minWidth: double.infinity,
//                   height: 40,
//                 )),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: Theme.of(context).buttonColor),
//                   onPressed: () {
//                     _listener.openGallery();
//                   },
//                   child: Text('gallery'),
//                 ),
//               ),

//               const SizedBox(height: 25.0),
//               Theme(
//                 data: Theme.of(context).copyWith(
//                     buttonTheme: ButtonThemeData(
//                   minWidth: double.infinity,
//                   height: 40,
//                 )),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: Theme.of(context).errorColor),
//                   onPressed: () {
//                     dismissDialog();
//                   },
//                   child: Text('button_cancel'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
