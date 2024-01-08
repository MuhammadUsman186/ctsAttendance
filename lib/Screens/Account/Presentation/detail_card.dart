import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> text = [];
    final List<Widget> text2 = [];
    final List<Widget> text3 = [];
    for (int i = 0; i < 9; i++) {
      text.add(Text(
        'English',
        style: Theme.of(context).textTheme.headline4,
      ));
    }
    for (int i = 0; i < 9; i++) {
      if (i < 2) {
        text2.add(Text(
          'KG-${i}',
          style: Theme.of(context).textTheme.headline4,
        ));
      } else {
        text2.add(Text(
          'Class ${i}',
          style: Theme.of(context).textTheme.headline4,
        ));
      }
    }
    for (int i = 0; i < 9; i++) {
      text3.add(Text(
        '7',
        style: Theme.of(context).textTheme.headline4,
      ));
    }
    return SizedBox(
      height: 310,
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'SUBJECT',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: text,
                  )
                ],
              ),
              Expanded(child: SizedBox()),
              Column(
                children: [
                  Text(
                    'CLASS',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: text2,
                  )
                ],
              ),
              Expanded(child: SizedBox()),
              Column(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      'CLASSES PER WEEK',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Column(
                    children: text3,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
