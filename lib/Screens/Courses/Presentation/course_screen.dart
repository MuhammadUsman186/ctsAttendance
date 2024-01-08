import 'package:cts_app/Screens/Courses/Presentation/course_controller.dart';

import 'package:cts_app/Screens/Courses/Presentation/tile_button.dart';
import 'package:cts_app/common_widgets/async_value_widget.dart';
import 'package:cts_app/common_widgets/filter.dart';

import 'package:cts_app/common_widgets/search_textfield.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseScreen extends ConsumerStatefulWidget {
  const CourseScreen({super.key});

  @override
  ConsumerState<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends ConsumerState<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    final courseController = ref.watch(courseListControllerProvider);
    return AsyncValueWidget(
      value: courseController,
      data: (course) => SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/background.png'),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'COURSES LIST',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: const Text(
                  'English',
                  style: TextStyle(
                      color: AppColors.cardBackgroundColor,
                      fontSize: 18,
                      fontFamily: FontsName.halveticaFont),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Expanded(
                        flex: 3,
                        child: SearchTextField(hint: 'Search for the course')),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        flex: 2,
                        child: FilterDialog(
                          onApply: () {},
                          onReset: () {},
                          removeSubstitution: false,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: course.length,
                    itemBuilder: (context, index) {
                      final course1 = course[index];
                      return TileCard(
                        reg_amount: course1.registeredStudents.toString(),
                        unreg_amount: course1.unRegisteredStudents.toString(),
                        reg: 'Registered',
                        unreg: 'Un-Registered',
                        sub: course1.courseName.toString(),
                        clas: course1.className.toString(),
                        height: 110,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
