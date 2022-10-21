import 'package:flutter/material.dart';
import 'package:mda_flutter_2022_01/model.dart';

import 'create_menu_page.dart';
import 'main.dart';
import 'menu_card.dart';
import 'menu_detail_page.dart';
import 'page_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MenuData> listElement = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: listElement.length,
        itemBuilder: (context, index) {
          MenuData menuData = listElement[index];
          return InkWell(
            child: MenuCard(menuData),
            onTap: () => navigateTo(
              context,
              MenuDetailPage(menuData),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => navigateTo(
          context,
          CreateMenuPage(onCreateMenu: (menuData) {
            listElement.add(menuData);

            setState(() {});
          }),
        ),
      ),
    );
  }
}

// const MenuData(
// title: "Tchip",
// description: "La préparation est de type been cin. Been cin signifie littéralement « une seule marmite » car le thiep se prépare avec une seule marmite (Niari cin signifie « deux marmites » et cette appellation désigne les plats sénégalais cuisinés avec deux marmites l'un comprenant la sauce et l'autre le riz cuit à la vapeur qui l'accompagne).",
// price: 2000,
// mainImage: "assets/images/pexels-photo-628776.jpeg",
// secondaryImage: "assets/images/pexels-photo-1351238.jpeg",
// )
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountEmail: Text("mda@gmail.com"),
            accountName: Text("Mali digital Awards"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            children: [
              // ListTile(
              //   leading: const CircleAvatar(
              //     child: Icon(Icons.add),
              //   ),
              //   title: const Text("Ajouter menu"),
              //   trailing: const Icon(Icons.navigate_next),
              //   // onTap: () => navigateTo(context, const CreateMenuPage()),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
