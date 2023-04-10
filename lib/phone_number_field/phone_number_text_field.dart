import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'phone_number_formatter.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({super.key});

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        PhoneNumberFormatter(),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffb7c8fd),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
