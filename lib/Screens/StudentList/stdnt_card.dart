import 'package:cts_app/Screens/StudentList/EmojisBar.dart';
import 'package:cts_app/common_widgets/primary_button.dart';
import 'package:cts_app/constants/images.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StdntCard extends StatelessWidget {
  final bool isAvail;
  const StdntCard({required this.isAvail, super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            autoClose: true,
            flex: 1,
            backgroundColor: AppColors.graphLow,
            foregroundColor: AppColors.primaryTextColor,
            onPressed: (value) {},
            label: 'LATE',
          ),
          SlidableAction(
            autoClose: true,
            flex: 1,
            backgroundColor: AppColors.graphLow,
            foregroundColor: AppColors.primaryTextColor,
            onPressed: (value) {},
            label: 'PRESE...',
          ),
        ],
      ),
      child: SizedBox(
        height: 90,
        child: Card(
          shadowColor: Colors.black,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  child: Image.asset(
                    Images.profile,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                isAvail
                    ? Expanded(
                        child: Text(
                          'Student Five',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      )
                    : Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Student Five',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            EmojiBar(
                              // onChanged: (int value) {
                              //   f = value;
                              // },
                              onChanged: (value) => print(value),
                            )
                          ],
                        ),
                      ),
                Builder(
                  builder: (context) => SizedBox(
                      height: 60,
                      width: (MediaQuery.of(context).size.width - 60) / 4,
                      child: PrimaryButton(
                        text: 'REPORT INCIDENT',
                        textColor: AppColors.primaryColor,
                        buttonHoverColor: const Color(0xffC1E6D1),
                        onPressed: () {
                          Slidable.of(context)!.openStartActionPane();
                        },
                        backgroundColor: const Color(0xffC1E6D1),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
