import 'package:cts_app/common_widgets/app_bar.dart';
import 'package:cts_app/constants/images.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class LiveAttendance extends StatelessWidget {
  const LiveAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background.png'),
        )),
        child: Column(children: [
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              SizedBox(
                width: 45,
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    height: 45,
                    child: IconButton(
                      color: Colors.white,
                      icon: Image.asset(Images.backArrow),
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'TAKE ATTEMDANCE',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text(
                      'Economics / Take Attendance / Live Mode',
                      style: TextStyle(
                          color: AppColors.cardBackgroundColor,
                          fontSize: 12,
                          fontFamily: FontsName.halveticaFont,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            'LIVE MODE ATTENDANCE',
            style: Theme.of(context).textTheme.headline1,
          )
        ]),
      ),
    );
  }
}
