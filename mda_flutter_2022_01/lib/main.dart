import 'package:flutter/material.dart';
import 'package:mda_flutter_2022_01/image_selector_page.dart';

import 'home_page.dart';
import 'statefull_page.dart';


void main() {
  runApp(const MdaApp());
}

class MdaApp extends StatelessWidget {
  const MdaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}


Future navigateTo(context, page) async {
  return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return page;
  }));
}
