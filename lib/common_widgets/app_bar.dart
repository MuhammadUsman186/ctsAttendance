import 'package:cts_app/constants/images.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  const CustomAppBar({super.key}) : preferredSize = const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(height: 50, child: Image.asset(Images.ctsLogo1)),
      automaticallyImplyLeading: false,
    );
  }
}
