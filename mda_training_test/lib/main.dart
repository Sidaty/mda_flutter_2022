import 'package:flutter/material.dart';

import 'ui/menu_page.dart';

void main() {
  runApp(TrainingApp());
}

class TrainingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MDA Training App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: TestWidgetsPage(),
      home: MenuPage(),
    );
  }
}

Future<T> navigateTo<T>(BuildContext context, Widget page) {
  return Navigator.of(context)
      .push<T>(MaterialPageRoute(builder: (context) => page));
}

