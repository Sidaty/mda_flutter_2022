import 'package:flutter/material.dart';
import 'package:mda_flutter_2022_01/menu_card.dart';
import 'package:mda_flutter_2022_01/model.dart';

class MenuDetailPage extends StatelessWidget {
  final MenuData menuData;
  const MenuDetailPage(this.menuData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuData.title),
      ),
      body: MenuCard(menuData, inDetailPage: true,),
    );
  }
}
