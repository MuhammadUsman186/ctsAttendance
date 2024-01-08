import 'package:cts_app/Screens/Attendance/kioske_attndnce_screen.dart';
import 'package:cts_app/Screens/Attendance/live_attndce_screen.dart';
import 'package:cts_app/common_widgets/primary_button.dart';
import 'package:cts_app/constants/images.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

class TileCard extends StatefulWidget {
  final double height;
  final String sub;
  final String clas;
  final String reg;
  final String unreg;
  final String reg_amount;
  final String unreg_amount;
  const TileCard(
      {required this.reg_amount,
      required this.unreg_amount,
      required this.reg,
      required this.unreg,
      required this.clas,
      required this.sub,
      required this.height,
      super.key});

  @override
  State<TileCard> createState() => _TileCardState();
}

class _TileCardState extends State<TileCard> {
  int n = 1;
  bool istap = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: GestureDetector(
        onTap: () {
          setState(() {
            n = 1;
            istap = !istap;
          });
        },
        child: Card(
          shadowColor: Colors.black,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.sub,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.clas,
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
                istap
                    ? Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Container(
                              decoration: DottedDecoration(
                                  shape: Shape.line,
                                  linePosition: LinePosition.right,
                                  dash: const <int>[9, 3],
                                  color: AppColors.primaryColor,
                                  strokeWidth: 1),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.unreg_amount,
                                    style: const TextStyle(
                                        color: AppColors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.unreg,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.reg_amount,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.reg,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    : n == 1
                        ? Row(
                            children: [
                              SizedBox(
                                  height: 60,
                                  width:
                                      (MediaQuery.of(context).size.width - 60) /
                                          4.3,
                                  child: PrimaryButton(
                                    text: 'STUDENTS LIST',
                                    textColor: AppColors.primaryColor,
                                    buttonHoverColor: Color(0xffC1E6D1),
                                    onPressed: () {},
                                    backgroundColor: Color(0xffC1E6D1),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                  height: 60,
                                  width:
                                      (MediaQuery.of(context).size.width - 55) /
                                          4.3,
                                  child: PrimaryButton(
                                    text: 'TAKE ATTENDANCE',
                                    textColor: AppColors.primaryColor,
                                    onPressed: (() {
                                      setState(() {
                                        n++;
                                      });
                                    }),
                                    backgroundColor: Color(0xffC1E6D1),
                                    buttonHoverColor: Color(0xffC1E6D1),
                                  ))
                            ],
                          )
                        : Row(children: [
                            SizedBox(
                              width: 40,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffC1E6D1),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 40,
                                  child: IconButton(
                                    color: Colors.white,
                                    icon: Image.asset(Images.backArrow),
                                    onPressed: (() {
                                      setState(() {
                                        n--;
                                      });
                                    }),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                height: 60,
                                width:
                                    (MediaQuery.of(context).size.width - 80) /
                                        4.8,
                                child: PrimaryButton(
                                  text: 'LIVE MODE',
                                  textColor: AppColors.primaryColor,
                                  buttonHoverColor: Color(0xffC1E6D1),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LiveAttendance()),
                                    );
                                  },
                                  backgroundColor: Color(0xffC1E6D1),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                height: 60,
                                width:
                                    (MediaQuery.of(context).size.width - 80) /
                                        4.8,
                                child: PrimaryButton(
                                  text: 'KISOK MODE',
                                  textColor: AppColors.primaryColor,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const KioskeMode()),
                                    );
                                  },
                                  backgroundColor: Color(0xffC1E6D1),
                                  buttonHoverColor: Color(0xffC1E6D1),
                                ))
                          ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
