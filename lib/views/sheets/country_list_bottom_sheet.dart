import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tt_phone_field/theme/app_colors.dart';

import '../../models/country.dart';
import '../list_views/country_list_view.dart';

void showCountryListBottomSheet({
  required BuildContext context,
  required ValueChanged<Country> onSelect,
  VoidCallback? onClosed,
  bool showPhoneCode = true,
  bool searchAutofocus = false,
  bool showWorldWide = false,
  bool showSearch = true,
}) {
  showMaterialModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        _builder(
          context,
          onSelect,
          showPhoneCode,
          searchAutofocus,
          showWorldWide,
          showSearch,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: Container(
            alignment: AlignmentDirectional.center,
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                size: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  ).whenComplete(() {
    if (onClosed != null) onClosed();
  });
}

Widget _builder(
  BuildContext context,
  ValueChanged<Country> onSelect,
  bool showPhoneCode,
  bool searchAutofocus,
  bool showWorldWide,
  bool showSearch,
) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final height = device - (statusBarHeight + (kToolbarHeight / 1.5));
  const backgroundColor = AppColors.mainColor;

  const BorderRadius borderRadius = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );

  return Container(
    height: height,
    decoration: const BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius,
    ),
    child: CountryListView(
      onSelect: onSelect,
      showPhoneCode: showPhoneCode,
      searchAutofocus: searchAutofocus,
      showWorldWide: showWorldWide,
      showSearch: showSearch,
    ),
  );
}
