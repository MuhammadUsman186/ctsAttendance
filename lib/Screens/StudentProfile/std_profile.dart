import 'package:camera/camera.dart';
import 'package:cts_app/Screens/StudentProfile/camera_page.dart';
import 'package:cts_app/Screens/StudentProfile/sparkchart.dart';
import 'package:cts_app/common_widgets/app_bar.dart';
import 'package:cts_app/constants/images.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class StdProfile extends StatelessWidget {
  final int id;
  final String fname;
  final String lname;
  final String image;
  const StdProfile({
    required this.id,
    required this.fname,
    required this.lname,
    required this.image,
    super.key,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background.png'),
        )),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 35,
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      height: 35,
                      child: IconButton(
                        color: Colors.white,
                        icon: Image.asset(Images.backArrow),
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'STUDENT PROFILE',
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 11),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Card(
                    shadowColor: Colors.black,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: (MediaQuery.of(context).size.height - 10) / 4.5,
                      width: (MediaQuery.of(context).size.width - 10) / 2.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'STUDENT PROFILE',
                            style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height: 60,
                              child: image == 'null'
                                  ? Image.asset(
                                      Images.profile,
                                      color: AppColors.primaryColor,
                                    )
                                  : Image.network(image)),
                          Text(
                            '${fname} ${lname}',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await availableCameras()
                                  .then((value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CameraPage(
                                                cameras: value,
                                                fname: fname,
                                                lname: lname,
                                                id: id,
                                              ))));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                      Images.faceDetect,
                                      color: AppColors.primaryColor,
                                    )),
                                Text(
                                  'Retake',
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                Row(children: [
                  Card(
                    shadowColor: Colors.black,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10, bottom: 25, top: 10),
                      width: (MediaQuery.of(context).size.width - 10) / 1.65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PARENTS INFO',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  Images.profile,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mother',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    'Parent One',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 13),
                                  ),
                                  Row(children: [
                                    const Icon(
                                      Icons.phone,
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '923001234567',
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 13),
                                    ),
                                  ]),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                  Images.profile,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mother',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Parent One',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 14),
                                  ),
                                  Row(children: [
                                    const Icon(
                                      Icons.phone,
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '923001234567',
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 13),
                                    ),
                                  ]),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ])
              ],
            ),
            Card(
              shadowColor: Colors.black,
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: (MediaQuery.of(context).size.height - 20) / 4,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'ATTENDANCE DETAILS',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(Images.download)
                    ],
                  ),
                  SizedBox(
                      height: (MediaQuery.of(context).size.height - 40) / 4.5,
                      child: const SparkChart())
                ]),
              ),
            ),
            Card(
              shadowColor: Colors.black,
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UPCOMING CLASSES',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
