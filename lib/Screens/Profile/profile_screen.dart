import 'package:cts_app/appmain_provider.dart';
import 'package:cts_app/common_widgets/app_bar.dart';
import 'package:cts_app/data/remote/network/SecureStorage.dart';
import 'package:cts_app/login/presentation/login.dart';

import 'package:cts_app/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants/images.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);

    SecureStorage storage = SecureStorage();
    List<String> myString = [
      AppLocalizations.of(context)!.attendanceTechnicalDifficulty,
      AppLocalizations.of(context)!.emptyClassWoutNote,
      AppLocalizations.of(context)!.studentWithAttendanceWarning,
      AppLocalizations.of(context)!.classNotAvailableForAttendance,
      AppLocalizations.of(context)!.setAttendanceReminder,
      AppLocalizations.of(context)!.unNotifiedEvent,
      AppLocalizations.of(context)!.privacyPolicy,
      AppLocalizations.of(context)!.termsAndConditions,
      AppLocalizations.of(context)!.changeLanguage,
      AppLocalizations.of(context)!.signOut,
    ];
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(right: 5, left: 5),
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background.png'),
        )),
        child: ListView(
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                SizedBox(
                  width: 45,
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      height: 45,
                      child: IconButton(
                        color: Colors.white,
                        icon: Image.asset(Images.backArrow),
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Settings',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        'Settings',
                        style: TextStyle(
                            color: AppColors.cardBackgroundColor,
                            fontSize: 16,
                            fontFamily: FontsName.halveticaFont,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: myString.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: (MediaQuery.of(context).size.height - 100) / 10,
                  child: InkWell(
                    onTap: index == 8
                        ? () {
                            if (currentLocale.languageCode == 'en') {
                              ref.read(localeProvider.notifier).state =
                                  const Locale('ar');
                            } else {
                              ref.read(localeProvider.notifier).state =
                                  const Locale('en');
                            }
                          }
                        : index == 9
                            ? () async {
                                final GoogleSignIn googleSignIn =
                                    GoogleSignIn();
                                final FirebaseAuth auth = FirebaseAuth.instance;
                                await googleSignIn.signOut();

                                await auth.signOut();
                                await storage.setPassword('');
                                await storage.setUsername('');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              }
                            : () {},
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Text(myString[index],
                                  style: index == 9
                                      ? const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)
                                      : Theme.of(context).textTheme.headline3),
                            ),
                            Icon(
                              Icons.keyboard_double_arrow_right,
                              color: AppColors.primaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
