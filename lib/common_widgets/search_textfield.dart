import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:cts_app/app_providers.dart';
import 'package:cts_app/constants/images.dart';
import 'package:cts_app/utils/app_theme.dart';

import '../constants/app_sizes.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.hint,
    this.oneSideRounded = true,
  });
  final String hint;
  final bool oneSideRounded;
  // final ValueChanged<String> onSubmitted;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _searchCourseController = TextEditingController();
  late final String hint;

  @override
  void initState() {
    hint = widget.hint;
    super.initState();
  }

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _searchCourseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // See this article for more info about how to use [ValueListenableBuilder]
    // with TextField:
    // https://codewithandrea.com/articles/flutter-text-field-form-validation/
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= tabWidth;
    // final currentLocale = ref.watch(localeProvider);
    bool isEnglish = true;
    // currentLocale.languageCode == "en"
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _searchCourseController,
      builder: (context, value, _) {
        return Container(
          height: isTablet ? kToolbarHeight : kToolbarHeight - 10,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: widget.oneSideRounded
                  ? BorderRadius.only(
                      topLeft: Radius.circular(
                          // ignore: dead_code
                          isEnglish ? kToolbarHeight / 2 : kToolbarHeight / 4),
                      bottomLeft: Radius.circular(
                          // ignore: dead_code
                          isEnglish ? kToolbarHeight / 2 : kToolbarHeight / 4),
                      topRight: Radius.circular(
                          // ignore: dead_code
                          isEnglish ? kToolbarHeight / 4 : kToolbarHeight / 2),
                      bottomRight: Radius.circular(
                          // ignore: dead_code
                          isEnglish ? kToolbarHeight / 4 : kToolbarHeight / 2))
                  : BorderRadius.circular(kToolbarHeight / 2)),
          child: TextField(
            controller: _searchCourseController,
            autofocus: false,
            style: isTablet
                ? Theme.of(context).textTheme.headline6!.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w400)
                : Theme.of(context).textTheme.headline6!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
            decoration: InputDecoration(
              // contentPadding: const EdgeInsets.all(Sizes.p4),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: isTablet
                  ? Theme.of(context).textTheme.headline6!.copyWith(
                      color: const Color(0xff8DACBC),
                      fontWeight: FontWeight.w400)
                  : Theme.of(context).textTheme.headline6!.copyWith(
                      color: const Color(0xff8DACBC),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
              prefixIcon: IconButton(
                icon: Image.asset(Images.search),
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                onPressed: () {},
              ),
              suffixIcon: value.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchCourseController.clear();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: AppColors.white,
                      ),
                    )
                  : null,
            ),
            // TODO: Implement onChanged
            onChanged: null,
            onSubmitted: (value) {
              // widget.onSubmitted(value);
            },
          ),
        );
      },
    );
  }
}
