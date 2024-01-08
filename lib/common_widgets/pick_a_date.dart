import 'package:flutter/material.dart';
// import 'package:cts_app/app_providers.dart';
import 'package:cts_app/constants/app_sizes.dart';
import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PickADateDialog extends StatefulWidget {
  const PickADateDialog({
    Key? key,
    // required this.onDateSelect,
  }) : super(key: key);
  // final ValueChanged<Map<String, String>> onDateSelect;

  @override
  State<PickADateDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<PickADateDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= tabWidth;
    // final currentLocale = ref.watch(localeProvider);
    // bool isEnglish = currentLocale.languageCode == "en";
    bool isEnglish = true;
    return GestureDetector(
      onTap: () {
        showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));
      },
      child: Container(
        height: isTablet ? kToolbarHeight : kToolbarHeight - 10,
        // height: MediaQuery.of(context).size.height,
        // width: isTablet ?  MediaQuery.of(context).size.width/3 : MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                    // ignore: dead_code
                    isEnglish ? kToolbarHeight / 2 : kToolbarHeight / 4),
                bottomRight: Radius.circular(
                    // ignore: dead_code
                    isEnglish ? kToolbarHeight / 2 : kToolbarHeight / 4),
                topLeft: Radius.circular(
                    // ignore: dead_code
                    isEnglish ? kToolbarHeight / 4 : kToolbarHeight / 2),
                bottomLeft: Radius.circular(
                    // ignore: dead_code
                    isEnglish ? kToolbarHeight / 4 : kToolbarHeight / 2))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                AppLocalizations.of(context)!.pickADate,
                style: isTablet
                    ? Theme.of(context).textTheme.headline6!.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.w500)
                    : Theme.of(context).textTheme.headline6!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
