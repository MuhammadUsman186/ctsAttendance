import 'package:cts_app/Screens/Bottom_NavBar/bottom_navbar.dart';

import 'package:cts_app/login/domain/login_model.dart';
import 'package:cts_app/login/presentation/login_controller.dart';
import 'package:cts_app/login/presentation/login_textfields.dart';

import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cts_app/common_widgets/logo.dart';
import 'package:cts_app/common_widgets/primary_button.dart';
import 'package:cts_app/constants/app_sizes.dart';
import 'package:cts_app/constants/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoState();
}

class _LoState extends ConsumerState<LoginScreen> {
  bool isInit = true;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if(isInit){
    //   ref.invalidate(accountRepositoryProvider);
    //   ref.invalidate(authRepositoryProvider);
    //   isInit = false;
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= tabWidth;
    ref.listen<AsyncValue<LoginModel?>>(loginControllerProvider,
        ((previous, next) {
      if (!next.isLoading && !next.hasError && next.value != null) {
        // ref.invalidate(accountRepositoryProvider);
        // ref.invalidate(courseRepositoryProvider);
        // ref.invalidate(studentsGridRepositoryProvider);
        // ref.invalidate(studentsListRepositoryProvider);
        // ref.invalidate(studentsProfileRepositoryProvider);
        // ref.invalidate(authRepositoryProvider);
        final loginModel = next.value!;
        if (loginModel.success == true) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(loginModel.message ?? "Error Occurred")));
        }
      }
    }));
    final loginController = ref.watch(loginControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                Images.threeStudents,
                fit: BoxFit.fitWidth,
              )),
          // buildListView(false),
          loginController.when(
              // skipLoadingOnReload: true,
              // skipLoadingOnRefresh: true,
              data: (loginModel) {
                return buildListView(isTablet);
              },
              error: (e, st) {
                debugPrint(e.toString());
                return buildListView(isTablet);
              },
              loading: () => const Center(child: CircularProgressIndicator()))
        ]),
      ),
    );
  }

  Widget buildListView(bool isTablet) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isTablet ? Sizes.p64 : Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gapH16,
              const Logo(widthFactor: 0.4),
              gapH64,
              Text(
                AppLocalizations.of(context)!.loginVia,
                style: Theme.of(context).textTheme.headline1,
              ),
              gapH32,
              const LoginTextFieldWithButtons(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password!",
                        // .forgotPassword
                        //  .toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.amber),
                        textAlign: TextAlign.start,
                      )),
                ],
              ),
              gapH32,
              buildOrWith(),
              gapH32,
              buildSocialLoginButtons(isTablet),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildOrWith() {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.secondaryTextColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
          child: Text(
            AppLocalizations.of(context)!.orWith,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColors.secondaryTextColor),
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.secondaryTextColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget buildSocialLoginButtons(bool isTablet) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: PrimaryButton(
                text: AppLocalizations.of(context)!.onelogin,
                onPressed: () {},
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                isLoading: false,
                textColor: Colors.black,
                buttonHoverColor: Colors.black,
              ),
            ),
            isTablet ? gapW16 : gapW12,
            Expanded(
              child: PrimaryButton(
                text: AppLocalizations.of(context)!.logInFaceID,
                onPressed: () {},
                backgroundColor: Colors.white,
                borderColor: AppColors.primaryColor,
                isLoading: false,
                textColor: AppColors.primaryColor,
                buttonHoverColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        gapH16,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: PrimaryButton(
                text: AppLocalizations.of(context)!.microsoft,
                onPressed: () {},
                backgroundColor: Colors.white,
                borderColor: const Color(0XFF497CC1),
                isLoading: false,
                textColor: const Color(0XFF497CC1),
                buttonHoverColor: const Color(0XFF497CC1),
              ),
            ),
            isTablet ? gapW16 : gapW12,
            Expanded(
              child: PrimaryButton(
                text: AppLocalizations.of(context)!.google,
                onPressed: () async {
                  await ref
                      .read(loginControllerProvider.notifier)
                      .signWithGoogle();
                  // final user = await controller.signWithGoogle();
                  // if (user != null) {
                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //     builder: (context) => const BottomNav(),
                  //   ));
                  // }
                },
                backgroundColor: Colors.white,
                borderColor: const Color(0XFFC74F3F),
                isLoading: false,
                textColor: const Color(0XFFC74F3F),
                buttonHoverColor: const Color(0XFFC74F3F),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
