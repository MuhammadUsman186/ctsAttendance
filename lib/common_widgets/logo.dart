import 'package:flutter/material.dart';
import 'package:cts_app/constants/images.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.widthFactor}) : super(key: key);
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      widthFactor: widthFactor,
      child: Image.asset(
        Images.ctsLogo2,
      ),
    );
  }
}
