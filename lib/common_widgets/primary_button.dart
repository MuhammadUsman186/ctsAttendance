import 'package:flutter/material.dart';
import 'package:cts_app/constants/app_sizes.dart';
import 'package:cts_app/utils/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.textColor = Colors.white,
    this.buttonHoverColor = AppColors.buttonHoverColor,
  });

  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? buttonHoverColor;
  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= tabWidth;
    return SizedBox(
      height: isTablet ? Sizes.p64 : 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return buttonHoverColor;
                } //<-- SEE HERE
                return null; // Defer to the widget's default.
              },
            ),
            textStyle: MaterialStateProperty.all(isTablet
                ? Theme.of(context).textTheme.headline3
                : Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 10)),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                } else {
                  //
                  return textColor;
                } // Defer to the widget's default.
              },
            ),
            minimumSize: MaterialStateProperty.all<Size>(
                const Size.fromHeight(Sizes.p32)),
            backgroundColor: MaterialStateProperty.all<Color>(
                backgroundColor ?? AppColors.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side:
                        BorderSide(color: borderColor ?? Colors.transparent)))),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
