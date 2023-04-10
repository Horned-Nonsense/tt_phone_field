import 'package:flutter/material.dart';

import 'pages/main_page.dart';

class PhoneFieldApp extends StatelessWidget {
  const PhoneFieldApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Phone field',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
