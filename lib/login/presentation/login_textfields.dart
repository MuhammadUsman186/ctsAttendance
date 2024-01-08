import 'package:cts_app/login/presentation/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cts_app/common_widgets/primary_button.dart';
import 'package:cts_app/constants/app_sizes.dart';
import 'package:cts_app/constants/images.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'string_validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Search field used to filter products by name
class LoginTextFieldWithButtons extends ConsumerStatefulWidget {
  const LoginTextFieldWithButtons({super.key});

  @override
  ConsumerState<LoginTextFieldWithButtons> createState() =>
      _LoginTextFieldWithButtonsState();
}

class _LoginTextFieldWithButtonsState
    extends ConsumerState<LoginTextFieldWithButtons> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(loginControllerProvider);
    return FocusScope(
      node: _node,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: _userController,
              builder: (context, value, _) {
                return TextFormField(
                  controller: _userController,
                  autofocus: false,
                  style: Theme.of(context).textTheme.headline6,
                  textInputAction: TextInputAction.next,
                  inputFormatters: <TextInputFormatter>[
                    ValidatorInputFormatter(
                        editingValidator: EmailEditingRegexValidator()),
                  ],
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "Username can't be empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.username,
                    hintStyle: Theme.of(context).textTheme.headline6,
                    focusColor: AppColors.primaryColor,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.primaryColor, width: 1.5)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.secondaryTextColor, width: 1.5)),
                    hoverColor: AppColors.primaryColor,
                    suffixIcon: value.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _userController.clear();
                              // TODO: Clear search state
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                  ),
                  // TODO: Implement onChanged
                  onChanged: null,
                );
              },
            ),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: _passwordController,
              builder: (context, value, _) {
                return TextFormField(
                  controller: _passwordController,
                  autofocus: false,
                  style: Theme.of(context).textTheme.headline6,
                  textInputAction: TextInputAction.done,
                  inputFormatters: <TextInputFormatter>[
                    ValidatorInputFormatter(
                        editingValidator: EmailEditingRegexValidator()),
                  ],
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "Password can't be empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.password,
                    hintStyle: Theme.of(context).textTheme.headline6,
                    focusColor: AppColors.primaryColor,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.primaryColor, width: 1.5)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.secondaryTextColor, width: 1.5)),
                    hoverColor: AppColors.primaryColor,
                    suffixIcon: IconButton(
                      onPressed: () {
                        hidePassword = !hidePassword;
                        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                        _passwordController.notifyListeners();
                        // TODO: Clear search state
                      },
                      icon: Image.asset(
                        hidePassword ? Images.eyeShow : Images.eyeClose,
                      ),
                    ),
                  ),
                  // TODO: Implement onChanged
                  onChanged: null,
                  obscureText: hidePassword,
                );
              },
            ),
            gapH32,
            RememberMe(
              rememberMe: (value) => rememberMe = value,
            ),
            gapH16,
            PrimaryButton(
              text: AppLocalizations.of(context)!.login,
              onPressed: () {
                _submit();
              },
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(loginControllerProvider.notifier);
      await controller.loginWithUsernamePassword(
          _userController.text, _passwordController.text, rememberMe);
    }
  }
}

class RememberMe extends StatefulWidget {
  final Function(bool) rememberMe;
  const RememberMe({Key? key, required this.rememberMe}) : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checkedValue = !checkedValue;
          widget.rememberMe(checkedValue);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          checkedValue
              ? SizedBox(
                  height: 34,
                  width: 42,
                  child: Image.asset(
                    Images.rectangleTick,
                    fit: BoxFit.fill,
                  ),
                )
              : SizedBox(
                  height: 28,
                  width: 30,
                  child: Image.asset(
                    Images.rectangle,
                    fit: BoxFit.fill,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
          gapW16,
          Text(
            AppLocalizations.of(context)!.rememberMe,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w100,
                color: checkedValue
                    ? AppColors.primaryColor
                    : AppColors.secondaryTextColor),
          )
        ],
      ),
    );
  }
}
