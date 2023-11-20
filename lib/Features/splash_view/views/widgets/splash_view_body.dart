import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../auth/presentation/login/presentation/views/login_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CachedNetworkImage(
          imageUrl:
              'https://img.freepik.com/free-vector/delivery-service-illustrated_23-2148505081.jpg?w=826&t=st=1697683289~exp=1697683889~hmac=cf2d9b681fdf8a6a90205e76a677395e73aa2dd41fba89a673ea988e3dd468b0',
        ),
      ),
    );
  }

  void navigateHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginView(),)
      );
    });
  }
}
