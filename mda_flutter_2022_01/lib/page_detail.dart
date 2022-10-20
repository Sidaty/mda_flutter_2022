import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {

  final int index;

  const PageDetail(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("$index", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
