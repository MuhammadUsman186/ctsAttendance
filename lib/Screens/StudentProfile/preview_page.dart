import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cts_app/common_widgets/app_bar.dart';
import 'package:cts_app/common_widgets/primary_button.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/profile_service.dart';

class PreviewPage extends StatelessWidget {
  final String fname;
  final String lname;
  final XFile picture;
  final int id;
  const PreviewPage(
      {required this.fname,
      required this.lname,
      required this.picture,
      required this.id,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background.png'),
        )),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                'SCANNING IS COMPLETE',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            DottedBorder(
              borderPadding: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(10),
              borderType: BorderType.RRect,
              radius: const Radius.circular(20),
              color: Colors.black,
              dashPattern: [5, 6],
              strokeWidth: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width - 50,
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      height: 340,
                      child: Image.file(
                        File(picture.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        '$fname ${lname}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(children: [
              Expanded(
                child: PrimaryButton(
                  text: 'NO',
                  buttonHoverColor: AppColors.primaryColor,
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: PrimaryButton(
                text: 'YES',
                onPressed: () async {
                  context.read<ProfileService>().getAllTasks(picture, id);
                  // Navigator.pop(context);
                },
                buttonHoverColor: AppColors.primaryColor,
              ))
            ])
          ],
        ),
      ),
    );
  }
}
