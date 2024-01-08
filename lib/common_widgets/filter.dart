import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:cts_app/app_providers.dart';
import 'package:cts_app/common_widgets/custom_expansion_tile.dart';
import 'package:cts_app/common_widgets/primary_button.dart';
import 'package:cts_app/constants/app_sizes.dart';
import 'package:cts_app/constants/images.dart';
import 'package:cts_app/utils/app_theme.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterDropDown extends StatefulWidget {
  const FilterDropDown({Key? key, required this.removeSubstitution})
      : super(key: key);
  final bool removeSubstitution;

  @override
  State<FilterDropDown> createState() => _FilterState();
}

class _FilterState extends State<FilterDropDown> {
  late final List<String> status = [];
  late final List<String> courses = [];
  late final List<String> classes = [];

  List<String> selectedItems = [];
  late final bool removeSubstitution;
  late final Map<String, Widget> checkBoxList = {};

  @override
  void initState() {
    removeSubstitution = widget.removeSubstitution;
    courses.addAll([
      "Course Name",
      "Course Name",
      "Course Name",
      "Course Name",
      "Course Name",
      "Course Name",
      "Course Name",
      "Course Name",
      "Course Name",
    ]);
    classes.addAll([
      "1A",
      "1B",
      "1C",
      "1D",
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= tabWidth;
    // final currentLocale = ref.watch(localeProvider);
    // bool isEnglish = currentLocale.languageCode == "en";
    bool isEnglish = true;
    if (status.isEmpty) {
      status.addAll([
        // AppLocalizations.of(context)!.registered,
        // AppLocalizations.of(context)!.notRegistered,
        // AppLocalizations.of(context)!.substitutionClass
      ]);
      if (removeSubstitution) {
        status.removeLast();
      }
    }
    return SizedBox(
      height: isTablet ? kToolbarHeight : kToolbarHeight - 10,
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            buttonDecoration: BoxDecoration(
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
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.white,
            ),
            isExpanded: true,
            hint: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppLocalizations.of(context)!.filter,
                style: isTablet
                    ? Theme.of(context).textTheme.headline6!.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.w500)
                    : Theme.of(context).textTheme.headline6!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
              ),
            ),
            items: status.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                //disable default onTap to avoid closing menu when selecting an item
                enabled: false,

                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final isSelected = selectedItems.contains(item);
                    return Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: FilterCheckBox(
                          title: item,
                          checkedValue: isSelected,
                          onPressed: () {
                            debugPrint("onpressed");
                            setState(() {
                              isSelected
                                  ? selectedItems.remove(item)
                                  : selectedItems.add(item);
                            });
                          },
                          key: Key(item)),
                    );
                  },
                ),
              );
            }).toList(),
            //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
            value: null,
            onChanged: (value) {},
            buttonHeight: kToolbarHeight,
            // buttonWidth: 140,
            buttonPadding: const EdgeInsets.symmetric(horizontal: 20),
            itemHeight: kToolbarHeight,
            dropdownWidth: isTablet
                ? MediaQuery.of(context).size.width / 2.5
                : MediaQuery.of(context).size.width / 1.5,
            dropdownOverButton: false,
            dropdownElevation: 0,
            offset: const Offset(-140, -10),
            iconSize: kToolbarHeight - 20,
            dropdownDecoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(Sizes.p16),
              border: Border.all(
                  color: AppColors.primaryColor.withOpacity(0.6), width: 1.5),
            ),
            // itemPadding: EdgeInsets.symmetric(horizontal: 66);,
            selectedItemBuilder: (context) {
              return status.map(
                (item) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      selectedItems.join(', '),
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  );
                },
              ).toList();
            },
          ),
        ),
      ),
    );
  }
}

class FilterDialog extends StatefulWidget {
  const FilterDialog(
      {Key? key,
      required this.removeSubstitution,
      required this.onApply,
      required this.onReset})
      : super(key: key);
  final bool removeSubstitution;
  final VoidCallback onApply;
  final VoidCallback onReset;

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late final List<String> status = [];
  late final List<String> courses = [];
  late final List<String> classes = [];

  List<String> selectedItems = [];
  late final bool removeSubstitution;
  late final Map<String, Widget> checkBoxList = {};

  @override
  void initState() {
    courses.addAll([
      "Course Name 1",
      "Course Name 2",
      "Course Name 3",
      "Course Name 4",
      "Course Name 5",
      "Course Name 6",
      "Course Name 7",
      "Course Name 8",
      "Course Name 9",
    ]);
    classes.addAll([
      "1A",
      "1B",
      "1C",
      "1D",
    ]);
    super.initState();
    removeSubstitution = widget.removeSubstitution;
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= tabWidth;
    // final currentLocale = ref.watch(localeProvider);
    // bool isEnglish = currentLocale.languageCode == "en";
    bool isEnglish = true;
    if (status.isEmpty) {
      status.addAll([
        AppLocalizations.of(context)!.registered,
        AppLocalizations.of(context)!.notRegistered,
        AppLocalizations.of(context)!.substitutionClass
      ]);
      if (removeSubstitution) {
        status.removeLast();
      }
    }
    return GestureDetector(
      onTap: () {
        Dialog dialog = Dialog(
          insetPadding: EdgeInsets.zero,
          // ignore: dead_code
          alignment: isEnglish ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: isTablet
                ? MediaQuery.of(context).size.width / 2
                : MediaQuery.of(context).size.width / 2,
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? Sizes.p32 : Sizes.p16, vertical: 10),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.filterUsersBy.toUpperCase(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Icon(
                      Icons.close,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
                gapH4,
                Divider(
                  color: AppColors.primaryColor,
                ),
                gapH8,
                CustomExpansionTile(
                  iconColor: AppColors.primaryColor,
                  initiallyExpanded: true,
                  tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                  // textColor: AppColors.primaryColor,
                  title: Text(
                    AppLocalizations.of(context)!.courseName,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: courses.map((item) {
                    final isSelected = selectedItems.contains(item);
                    return Container(
                      // height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 3),
                      child: FilterCheckBox(
                          title: item,
                          checkedValue: isSelected,
                          onPressed: () {
                            debugPrint("onpressed");
                            setState(() {
                              isSelected
                                  ? selectedItems.remove(item)
                                  : selectedItems.add(item);
                            });
                          },
                          key: Key(item)),
                    );
                  }).toList(),
                ),
                gapH12,
                CustomExpansionTile(
                  iconColor: AppColors.primaryColor,
                  initiallyExpanded: true,
                  tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                  // textColor: AppColors.primaryColor,
                  title: Text(
                    AppLocalizations.of(context)!.className,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: classes.map((item) {
                    final isSelected = selectedItems.contains(item);
                    return Container(
                      // height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 3),
                      child: FilterCheckBox(
                          title: item,
                          checkedValue: isSelected,
                          onPressed: () {
                            debugPrint("onpressed");
                            setState(() {
                              isSelected
                                  ? selectedItems.remove(item)
                                  : selectedItems.add(item);
                            });
                          },
                          key: Key(item)),
                    );
                  }).toList(),
                ),
                gapH12,
                CustomExpansionTile(
                  iconColor: AppColors.primaryColor,
                  initiallyExpanded: true,
                  tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                  // textColor: AppColors.primaryColor,
                  title: Text(
                    AppLocalizations.of(context)!.status,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: classes.map((item) {
                    final isSelected = selectedItems.contains(item);
                    return Container(
                      // height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 3),
                      child: FilterCheckBox(
                          title: item,
                          checkedValue: isSelected,
                          onPressed: () {
                            debugPrint("onpressed");
                            setState(() {
                              isSelected
                                  ? selectedItems.remove(item)
                                  : selectedItems.add(item);
                            });
                          },
                          key: Key(item)),
                    );
                  }).toList(),
                ),
                isTablet ? gapH180 : gapH32,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: PrimaryButton(
                            text: AppLocalizations.of(context)!
                                .reset
                                .toUpperCase(),
                            onPressed: () {},
                            isLoading: false,
                          ),
                        ),
                      ),
                      isTablet ? gapW16 : gapW12,
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: PrimaryButton(
                            text: AppLocalizations.of(context)!
                                .apply
                                .toUpperCase(),
                            onPressed: () {},
                            isLoading: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
        showDialog(
          context: context,
          builder: (context) => dialog,
        );
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
                AppLocalizations.of(context)!.filter,
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

class FilterCheckBox extends StatefulWidget {
  const FilterCheckBox(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.checkedValue})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final bool checkedValue;

  @override
  State<FilterCheckBox> createState() => _FilterCheckBoxState();
}

class _FilterCheckBoxState extends State<FilterCheckBox> {
  late bool checkedValue;

  @override
  void initState() {
    checkedValue = widget.checkedValue;
    print(widget.key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= tabWidth;
    return GestureDetector(
      onTap: () {
        setState(() {
          checkedValue = !checkedValue;
          widget.onPressed();
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          checkedValue
              ? SizedBox(
                  height: isTablet ? 34 : 24,
                  width: isTablet ? 42 : 28,
                  child: Image.asset(
                    Images.rectangleTick,
                    fit: BoxFit.fill,
                  ),
                )
              : SizedBox(
                  height: isTablet ? 28 : 22,
                  width: isTablet ? 30 : 22,
                  child: Image.asset(
                    Images.rectangle,
                    fit: BoxFit.fill,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
          gapW16,
          Text(
            widget.title,
            style: isTablet
                ? Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w100,
                    color: checkedValue
                        ? AppColors.primaryColor
                        : AppColors.secondaryTextColor)
                : Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w100,
                    fontSize: 12,
                    color: checkedValue
                        ? AppColors.primaryColor
                        : AppColors.secondaryTextColor),
          )
        ],
      ),
    );
  }
}
