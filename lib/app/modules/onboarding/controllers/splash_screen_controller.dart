import 'dart:io';

import 'package:clothes_app/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../models/languages_model.dart';
import 'package:permission_handler/permission_handler.dart' as permissionHandle;

class SplashScreenController extends GetxController {
  final store = GetStorage();
  final isDartTheme = false.obs;
  final permissionGranted = permissionHandle.PermissionStatus.denied.obs;

  @override
  void onReady() {
    super.onReady();
    if (store.read('themeMode') == null) saveThemeMode(false);
    isDartTheme.value = store.read('themeMode');

    //requestCameraPermission();
    Future.delayed(Duration(seconds: 3), () async {
      Get.offAndToNamed(Routes.HOME);
    });
  }

  void changeLanguage(Language lang) {
    print(lang.lang_code);
  }

  void saveThemeMode(bool themeMode) {
    store.write('themeMode', themeMode);
  }

  Future<void> requestLocationPermission() async {
    print('Location permission');
    var status = await permissionHandle.Permission.locationWhenInUse.status;
    print(status);
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      print('Location permission denied');
    }
    if (await permissionHandle.Permission.locationWhenInUse
        .request()
        .isGranted) {
      // Either the permission was already granted before or the user just granted it.
      var backgroundLocationPermission =
          await permissionHandle.Permission.locationAlways.status;
      if (backgroundLocationPermission.isDenied) {
        permissionHandle.openAppSettings();
      }
    }
  }

  Future<void> requestCameraPermission() async {
    if (!Platform.isMacOS) {
      print('Camera permission');
      await Future.delayed(Duration(seconds: 5));
      var status = await permissionHandle.Permission.camera.status;
      print(status);
      if (status.isDenied) {
        // We didn't ask for permission yet or the permission has been denied before but not permanently.
        print('Camera permission denied');
      }
      if (await permissionHandle.Permission.camera.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
      }
    }
  }

  Future<void> requestNotificationPermission() async {
    if (!Platform.isMacOS) {
      print('Notification permission');
      await Future.delayed(Duration(seconds: 5));
      var status = await permissionHandle.Permission.notification.status;
      print(status);
      if (status.isDenied) {
        // We didn't ask for permission yet or the permission has been denied before but not permanently.
        print('Notification permission denied');
      }
      if (await permissionHandle.Permission.notification.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
      }
    }
  }
}
