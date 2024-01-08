import 'package:flutter/material.dart';
import 'package:cts_app/constants/app_sizes.dart';
import 'package:cts_app/utils/app_theme.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
  });

  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= tabWidth;
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.cardButtonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ))),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                textAlign: TextAlign.center,
                style: isTablet
                    ? Theme.of(context).textTheme.headline4
                    : Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 10),
              ),
      ),
    );
  }
}
