import 'package:cts_app/Screens/StudentList/std_list_screen.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final double height;
  final String sub;
  final String? date;
  final String day;
  final String clas;
  final String amt;
  const ListCard(
      {required this.date,
      required this.day,
      required this.clas,
      required this.sub,
      required this.height,
      required this.amt,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StudentList()),
        );
      },
      child: SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width - 60,
        child: Card(
            shadowColor: Colors.black,
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sub,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        clas,
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 60) / 4.5,
                ),
                SizedBox(
                  height: 60,
                  child: Container(
                    decoration: DottedDecoration(
                      shape: Shape.line,
                      linePosition: LinePosition.right,
                      dash: <int>[9, 6],
                      color: AppColors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      date!,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: 10,
                    //     ),

                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     SizedBox(
                    //       width: 10,
                    //     ),

                    //   ],
                    // )
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Text(
                    amt,
                    style: const TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
