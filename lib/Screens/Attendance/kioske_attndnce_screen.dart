import 'package:cts_app/common_widgets/app_bar.dart';
import 'package:flutter/material.dart';

class KioskeMode extends StatelessWidget {
  const KioskeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background.png'),
        )),
      ),
    );
  }
}
