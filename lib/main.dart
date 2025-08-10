import 'package:flutter/material.dart';


import 'core/di.dart';

import 'di/di.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await configureDependencies();
  runApp(const MyApp());
}
