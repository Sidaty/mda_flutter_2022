import 'package:flutter/material.dart';
import 'package:mda_flutter_2022_01/menu_card.dart';
import 'package:mda_flutter_2022_01/model.dart';

class MenuDetailPage extends StatelessWidget {
  final MenuData menuData;
  final void Function(MenuData) addItem;

  const MenuDetailPage(this.menuData, this.addItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuData.title),
      ),
      body: MenuCard(menuData, addItem, inDetailPage: true,),
    );
  }
}
