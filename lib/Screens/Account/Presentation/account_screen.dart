import 'package:cts_app/Screens/Account/Presentation/acc_details.dart';
import 'package:cts_app/Screens/Account/Presentation/account_controller.dart';
import 'package:cts_app/Screens/Account/Presentation/detail_card.dart';
import 'package:cts_app/Screens/Account/Presentation/radial_gauge.dart';
import 'package:cts_app/Screens/Account/Presentation/stacket_bar.dart';
import 'package:cts_app/Screens/Profile/profile_screen.dart';
import 'package:cts_app/common_widgets/async_value_widget.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final accountController = ref.watch(accountControllerProvider);
    return AsyncValueWidget(
      value: accountController,
      data: (account) => SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(right: 5, left: 5),
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/background.png'),
            )),
            child:
                // final account2 = value.data.school;

                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'MY ACCOUNT',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text(
                            'My Account',
                            style: TextStyle(
                                color: AppColors.cardBackgroundColor,
                                fontSize: 18,
                                fontFamily: FontsName.halveticaFont,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.goToSettings,
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.white),
                            ),
                            const Icon(
                              Icons.settings,
                              size: 28,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Container(
                    //       width: 150,
                    //       child: PrimaryButton(
                    //           text: AppLocalizations.of(context)!.goToSettings),
                    //     )
                    //   ],
                    // )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      AccCard(
                        text1: account.data!.name!,
                        text2: 'Middle School Teacher',
                        clas: '9 classes',
                        no: account.data!.phone!,
                        mail: account.data!.email!,
                        height: 160,
                        age: account.data!.classesPerWeek.toString(),
                        weekdays: 'Classes per',
                        week: 'Week',
                      ),
                      AccCard(
                        text1: account.data!.school!.name ?? '',
                        text2: 'Middle And High School',
                        clas:
                            'From Grade ${account.data!.school!.gradeLow} To Grade ${account.data!.school!.gradeHigh}',
                        no: account.data!.school!.phone.toString(),
                        mail: account.data!.school!.principleEmail.toString(),
                        height: 160,
                        age: '',
                        week: '',
                        weekdays: '',
                      ),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                const DetailCard(),
                SizedBox(
                  height: 390,
                  child: Card(
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, top: 10, right: 10, left: 10),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ATTENDANCE DETAILS',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                const Icon(
                                  Icons.download,
                                  size: 20,
                                )
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 130,
                                height: 150,
                                child: RadialGauge(),
                              ),
                              SizedBox(
                                height: 330,
                                width: 200,
                                child: ColumnBar(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget builAccountCard() {
    return Container();
  }
}
