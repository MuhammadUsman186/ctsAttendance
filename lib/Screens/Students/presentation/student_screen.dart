import 'package:cts_app/Screens/Students/presentation/grid_tile.dart';
import 'package:cts_app/Screens/Students/presentation/students_grid_controller.dart';
import 'package:cts_app/common_widgets/async_value_widget.dart';
import 'package:cts_app/common_widgets/filter.dart';
import 'package:cts_app/common_widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/app_theme.dart';

class StudentScreen extends ConsumerStatefulWidget {
  const StudentScreen({super.key});

  @override
  ConsumerState<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends ConsumerState<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    final studentGridcontorller = ref.watch(studentsGridControllerProvider);

    return AsyncValueWidget(
      value: studentGridcontorller,
      data: (student) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background.png'),
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'STUDENTS LIST',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: const Text(
                  '/ Students List',
                  style: TextStyle(
                      color: AppColors.cardBackgroundColor,
                      fontSize: 18,
                      fontFamily: FontsName.halveticaFont,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SearchTextField(hint: 'Search for the student'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 2,
                      child: FilterDropDown(removeSubstitution: false),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridLayout(
                length: student.length,
                data: student,
              )
            ],
          ),
        ),
      ),
    );
  }
}
