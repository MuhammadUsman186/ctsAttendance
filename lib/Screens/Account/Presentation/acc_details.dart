import 'package:cts_app/utils/app_theme.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class AccCard extends StatelessWidget {
  final double height;
  final String text1;
  final String text2;
  final String clas;
  final String no;
  final String mail;
  final String? age;
  final String? weekdays;
  final String? week;

  const AccCard(
      {this.week,
      required this.text1,
      required this.clas,
      required this.height,
      this.age,
      this.weekdays,
      required this.mail,
      required this.no,
      required this.text2,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.greyLight,
                    borderRadius: BorderRadius.circular(15)),
                height: 80,
                width: 80,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: DottedDecoration(
                    shape: Shape.line,
                    linePosition: LinePosition.right,
                    dash: <int>[16, 7],
                    color: AppColors.grey,
                    strokeWidth: 2),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text2,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          clas,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Row(children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            no,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ]),
                        Row(children: [
                          const Icon(
                            Icons.alternate_email,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            mail,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: SizedBox(),
              ),
              Column(
                children: [
                  Text(
                    age!,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          weekdays!,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          week!,
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
