import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  final int numberLength;

  PhoneNumberFormatter(this.numberLength);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.length > numberLength) {
      return oldValue;
    } else {
      String strippedText = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
      String resultText = '';

      if (strippedText.length > 3) {
        resultText += '(${strippedText.substring(0, numberLength - 7)}) ';
        strippedText = strippedText.substring(numberLength - 7);
      }
      if (strippedText.length > 3) {
        resultText += '${strippedText.substring(0, 3)}-';
        strippedText = strippedText.substring(3);
      }
      resultText += strippedText;

      return newValue.copyWith(
        text: resultText,
        selection: TextSelection.collapsed(offset: resultText.length),
      );
    }
  }
}
