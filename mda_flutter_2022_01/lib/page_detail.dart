import 'package:flutter/material.dart';
import 'package:mda_flutter_2022_01/model.dart';

class PageDetail extends StatelessWidget {
  final MenuData element;

  const PageDetail(this.element, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          element.title,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
