import 'package:cts_app/Screens/Account/Presentation/account_screen.dart';

import 'package:cts_app/Screens/Courses/Presentation/course_screen.dart';
import 'package:cts_app/Screens/History/Presentation/history_screen.dart';
import 'package:cts_app/Screens/Report/report_screen.dart';
import 'package:cts_app/Screens/Students/presentation/student_screen.dart';
import 'package:cts_app/common_widgets/app_bar.dart';
import 'package:cts_app/constants/images.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: IndexedStack(index: index, children: const [
        StudentScreen(),
        CourseScreen(),
        ReportScreen(),
        HistoryScreen(),
        AccountScreen()
      ]),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (int newindex) {
            setState(() {
              index = newindex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.students)),
              label: "Students",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.courses)),
              label: "Courses",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.report)),
              label: "Report",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.history)),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.account)),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}

// final List _screens = [];
