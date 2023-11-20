import 'package:flutter/material.dart';
import 'package:food/Features/drawer/presentation/views/widgets/drawer_body.dart';


class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DrawerBody(),
    );
  }
}
