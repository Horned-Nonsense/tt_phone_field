import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _bacgroundColor = const Color(0xff93a9f5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          _buildPhoneField(),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return Row(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: "Enter your number"),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ],
    );
  }
}
