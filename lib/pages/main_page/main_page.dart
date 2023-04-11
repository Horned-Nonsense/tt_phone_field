import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tt_phone_field/theme/app_colors.dart';
import 'package:tt_phone_field/theme/app_text_styles.dart';

import '../../models/country.dart';
import '../../views/fields/app_field/app_text_field.dart';
import '../../views/fields/app_field/phone_number_formatter.dart';
import '../../views/sheets/country_list_bottom_sheet.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Country _selectedCountry = Country.worldWide;
  String _phoneNumber = '';
  final _controller = TextEditingController();

  bool isMobileNumberValid(String phoneNumber) {
    String regexPattern = r'^[(][1-9]{2,3,4}[) ][0-9]{3}[0-9]{4}$';
    RegExp regExp = RegExp(regexPattern);

    if (phoneNumber.isEmpty) {
      return false;
    } else if (regExp.hasMatch(phoneNumber)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              'Enter your number',
              style: AppTextStyles.mainTextStyle,
            ),
          ),
          backgroundColor: AppColors.mainColor,
          elevation: 0,
        ),
        body: _buildBody(),
        floatingActionButton: _buildForwardButton(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.all(32),
          child: _buildPhoneNumberField(),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberField() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCountrySelectedButton(),
        const SizedBox(width: 12),
        Expanded(
          child: AppTextField(
            controller: _controller,
            onChanged: (text) {
              setState(() {
                _phoneNumber = text;
              });
            },
            hintText: 'Your number',
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              PhoneNumberFormatter(_selectedCountry.example.length),
            ],
            keyboardType: TextInputType.number,
            enabled: _selectedCountry != Country.worldWide,
          ),
        ),
      ],
    );
  }

  Widget _buildCountrySelectedButton() {
    return OutlinedButton(
      onPressed: () {
        showCountryListBottomSheet(
          context: context,
          onSelect: (Country country) {
            setState(() {
              _selectedCountry = country;
              _controller.text = '';
            });
          },
        );
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.secondaryColor,
        side: BorderSide.none,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        fixedSize: const Size(120, 68),
      ),
      child: Text(
        _selectedCountry == Country.worldWide
            ? _selectedCountry.flagEmoji
            : '${_selectedCountry.flagEmoji.toUpperCase()} +${_selectedCountry.phoneCode}',
        style: AppTextStyles.secondaryTextStyle,
      ),
    );
  }

  Widget _buildForwardButton() {
    //'+4' - is the number of additional symbols
    //in phone number format: (, ), -, ' '
    bool enabledButton =
        _phoneNumber.length == _selectedCountry.example.length + 4;

    return OutlinedButton(
      onPressed: enabledButton ? () {} : null,
      style: OutlinedButton.styleFrom(
        backgroundColor: enabledButton
            ? AppColors.secondaryColor
            : AppColors.secondaryColor.withOpacity(0.5),
        side: BorderSide.none,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        fixedSize: const Size.square(60),
      ),
      child: const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
    );
  }
}
