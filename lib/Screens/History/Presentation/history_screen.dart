import 'package:cts_app/Screens/History/Presentation/history_controller.dart';
import 'package:cts_app/Screens/History/Presentation/list_card.dart';

import 'package:cts_app/common_widgets/async_value_widget.dart';
import 'package:cts_app/common_widgets/pick_a_date.dart';
import 'package:cts_app/common_widgets/search_textfield.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final historyController = ref.watch(historyListControllerProvider);
    return AsyncValueWidget(
      value: historyController,
      data: (history) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              Text(
                'HISTORY',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Text(
                'History',
                style: TextStyle(color: AppColors.cardBackgroundColor),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: SearchTextField(hint: 'Search for the class')),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(flex: 2, child: PickADateDialog())
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        final history1 = history[index];
                        return ListCard(
                          date: history1.startDate,
                          day: history1.days.toString(),
                          amt: history1.day.toString(),
                          height: 90,
                          sub: history1.course.toString(),
                          clas: history1.className.toString(),
                        );
                      }))
            ],
          )),
    );
  }
}
