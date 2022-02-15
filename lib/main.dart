import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetask/core/utils/app_theme.dart';
import 'package:firebasetask/di.dart';
import 'package:firebasetask/presentation/screens/home/home_screen.dart';
import 'package:firebasetask/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/pref_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool isLogin = await PreferenceUtils.getBool("isLoggedIn",defaultValue: false);
  await initDI();
  runApp(
    ScreenUtilInit(
      builder: () => MyApp(isLogin: isLogin,),
      designSize: const Size(375, 812),
    ),
  );
}

class MyApp extends StatelessWidget {

  final bool? isLogin;
  MyApp({this.isLogin});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: AppRoutes,
      initialRoute: isLogin! ? HomeScreen.routeName : '/',
    );
  }
}
