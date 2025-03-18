import 'package:flutter/material.dart';
import 'package:cy_road_signs/app.dart';
import 'package:hive_ce_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const Application());
}
