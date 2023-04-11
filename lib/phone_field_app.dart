import 'package:flutter/material.dart';

import 'pages/main_page/main_page.dart';

class PhoneFieldApp extends StatelessWidget {
  const PhoneFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Phone field',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
