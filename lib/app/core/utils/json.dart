import 'dart:convert';

import 'package:flutter/services.dart';

Future loadJson(String asset) async {
  String data = await rootBundle.loadString(asset);
  return json.decode(data);
}