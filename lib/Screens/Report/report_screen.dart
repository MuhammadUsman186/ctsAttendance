import 'package:cts_app/common_widgets/search_textfield.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/background.png'),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'STUDENTS LIST',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Report',
                  style: TextStyle(
                      color: AppColors.cardBackgroundColor,
                      fontSize: 18,
                      fontFamily: FontsName.halveticaFont,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchTextField(
                    hint: 'Search for the reports',
                    oneSideRounded: false,
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                    shadowColor: Colors.black,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Coming Soon',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
