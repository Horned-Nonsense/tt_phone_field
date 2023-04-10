import 'package:flutter/material.dart';
import 'package:tt_phone_field/phone_number_field/phone_number_text_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _bacgroundColor = const Color(0xff93a9f5);
  final _fillColor = const Color(0xffb7c8fd);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: _bacgroundColor,
        appBar: AppBar(
          title: const Text(
            'Enter your number',
            style: TextStyle(fontSize: 32),
          ),
          backgroundColor: _bacgroundColor,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.all(32),
              child: _buildPhoneField(),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Expanded(
          child: PhoneNumberTextField(),
        ),
      ],
    );
  }
}
