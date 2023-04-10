import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  static const int _phoneNumberLength = 10;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = RegExp(r'\d+');
    final oldDigits = oldValue.text.replaceAll(digitsOnly, '');
    final newDigits = newValue.text.replaceAll(digitsOnly, '');

    var value = '';

    for (var i = 0; i < newDigits.length; i++) {
      value += newDigits[i];
      if (i == 2 || i == 5) {
        value += '-';
      }
    }

    final cursorOffset =
        newValue.selection.end + value.length - newValue.text.length;

    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: cursorOffset),
    );
  }
}
