import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/Features/home/presentation/views/home_view.dart';
import 'package:food/core/Utils/function/api_servic.dart';
import 'Features/auth/presentation/login/presentation/views/login_view.dart';
import 'core/Utils/function/cache_helper.dart';
import 'core/constant/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  ApiService(Dio());
  await CacheHelper.init();
  Widget widget;
  String? token = await CacheHelper.getData(key: 'token');
  if (token != null) {
    widget = const HomeView();
  } else {
    widget = const LoginView();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF5F5F3),
      ),
      home: startWidget,
    );
  }
}
