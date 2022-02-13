import 'package:firebasetask/presentation/screens/home/home_screen.dart';
import 'package:firebasetask/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> AppRoutes = {
  '/': (_) => const LoginScreen(),
  HomeScreen.routeName: (_) => HomeScreen(),
};
