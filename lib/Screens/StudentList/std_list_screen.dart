import 'package:cts_app/Screens/StudentList/stdnt_card.dart';
import 'package:cts_app/common_widgets/app_bar.dart';
import 'package:cts_app/common_widgets/primary_button.dart';
import 'package:cts_app/constants/images.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  int _selectedTabbar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background.png'),
        )),
        child: ListView(
          children: [
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
                        'STUDENTS LIST',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        'Economics / Configure Attendance',
                        style: TextStyle(
                            color: AppColors.cardBackgroundColor,
                            fontSize: 16,
                            fontFamily: FontsName.halveticaFont,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(1),
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Color(0xff718E9F),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(),
                        automaticIndicatorColorAdjustment: false,
                        labelColor: AppColors.primaryColor,
                        labelStyle: Theme.of(context).textTheme.headline5,
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.headline5,
                        unselectedLabelColor: AppColors.white,
                        indicatorColor: AppColors.primaryColor,
                        indicator: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 1)
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Colors.white),
                        onTap: (index) {
                          print(index);
                          setState(() {
                            _selectedTabbar = index;
                          });
                        },
                        tabs: [
                          Tab(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'DETECTED STUDENTS',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text('0', style: TextStyle(fontSize: 12))
                              ],
                            ),
                          ),
                          Tab(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'ABSENT STUDENTS',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text('4', style: TextStyle(fontSize: 12))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(builder: (_) {
                      if (_selectedTabbar == 0) {
                        return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 2,
                                    color: Colors.black,
                                    blurStyle: BlurStyle.outer)
                              ],
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return StdntCard(isAvail: false);
                                })); //1st custom tabBarView
                      } else {
                        return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 2,
                                    color: Colors.black,
                                    blurStyle: BlurStyle.outer)
                              ],
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return StdntCard(
                                    isAvail: true,
                                  );
                                })); //2nd tabView
                      }
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: const [
                      Expanded(
                        child: PrimaryButton(text: 'RE-TAKE ATTENDANCE'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(child: PrimaryButton(text: 'DONE AND SAVE'))
                    ])
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
  //  height: 500, //height of TabBarView
  //                         decoration: const BoxDecoration(
  //                           boxShadow: [
  //                             BoxShadow(
  //                                 offset: Offset(0, 0),
  //                                 blurRadius: 2,
  //                                 color: Colors.black,
  //                                 blurStyle: BlurStyle.outer)
  // //                           ],
  //  decoration: const BoxDecoration(
  //                       boxShadow: [
  //                         BoxShadow(
  //                             offset: Offset(0, 0),
  //                             blurRadius: 2,
  //                             color: Colors.black,
  //                             blurStyle: BlurStyle.outer)
  //                       ],
                       
  //                     ),