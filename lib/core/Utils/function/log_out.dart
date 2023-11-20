import 'package:flutter/material.dart';
import 'package:food/Features/auth/presentation/login/presentation/views/login_view.dart';

import 'cache_helper.dart';

void singOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      );
    }
  });
}