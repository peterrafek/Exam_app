
import 'package:exam_app/presentaion/features/auth/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/themes/my_theme.dart';
import 'core/routes_manager.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
         home: SignUpScreen(),
        // initialRoute: RoutesManager.logIn,
        theme: MyTheme.light,
      ),
    );
  }
}
