import 'package:flutter/material.dart';
import 'package:mda_flutter_2022_01/model.dart';

import 'create_menu_page.dart';
import 'main.dart';
import 'menu_card.dart';
import 'menu_detail_page.dart';
import 'shopping_cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MenuData> listElement = [sushi, steakFrites, brochettesDeBoeuf];
  final Map<int, CartItemData> items = {};

  void addItem(MenuData menuData) {
    CartItemData? item = items[menuData.id];
    if (item == null) {
      item = CartItemData(
        id: DateTime.now().microsecond,
        count: 1,
        menuData: menuData,
      );
      items[menuData.id] = item;
    }

    item.increment();

    setState(() {});
  }

  removeItem(MenuData menuData) {
    CartItemData? item = items[menuData.id];
    if (item == null) {
      item = CartItemData(
        id: DateTime.now().microsecond,
        count: 1,
        menuData: menuData,
      );
      items[menuData.id] = item;
    }

    item.increment();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              navigateTo(
                  context,
                  ShoppingCartPage(
                    items.values.toList(),
                    addItem: addItem,
                    removeItem: removeItem,
                  ));
            },
            child: Stack(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.shopping_cart),
                ),
                if (items.isNotEmpty)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text(
                        "${items.values.map((e) => e.count).reduce((x, y) => x + y)}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: listElement.length,
        itemBuilder: (context, index) {
          MenuData menuData = listElement[index];
          return InkWell(
            child: MenuCard(menuData, addItem),
            onTap: () => navigateTo(
              context,
              MenuDetailPage(menuData, addItem),
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

const sushi = MenuData(
  price: 6500,
  id: 1,
  title: 'Sushi',
  mainImage: 'assets/images/pexels-photo-628776.jpeg',
  secondaryImage: 'assets/images/pexels-photo-853006.jpeg',
  description:
      'Le sushi est un plat traditionnel japonais, composé d\'un riz vinaigré appelé shari combiné avec un autre ingrédient appelé neta qui est habituellement du poisson cru ou des fruits de mer.',
);

const steakFrites = MenuData(
  price: 5000,
  id: 2,
  title: 'Steak frites',
  mainImage: 'assets/images/pexels-photo-3535383.jpeg',
  secondaryImage: 'assets/images/pexels-photo-1583884.jpeg',
  description:
      'Le steak frites est un plat fréquemment servi en brasserie et dans les restaurants. Étant le plat principal, il peut être précédé d\'une entrée, et suivi de fromages et/ou desserts.',
);

const brochettesDeBoeuf = MenuData(
  price: 4500,
  id: 3,
  title: 'Brochettes de bœuf',
  mainImage: 'assets/images/pexels-photo-3026805.jpeg',
  secondaryImage: 'assets/images/pexels-photo-3756523.jpeg',
  description:
      '''Dans un grand bol, mélanger l’huile, la sauce soya, le vinaigre, la cassonade, le poivre et l’ail. Ajouter la viande et bien l’enrober. Couvrir et réfrigérer 1 heure pour du filet mignon ou 24 heures pour de la bavette (voir note).
  Égoutter la viande et jeter la marinade. Enfiler les cubes de viande sur les brochettes. Laisser tempérer la viande 15 minutes.
Régler le barbecue à puissance élevée. Huiler la grille.
Griller les brochettes 4 minutes de chaque côté ou jusqu’à cuisson saignante ou rosée. Saler légèrement (car la marinade est déjà salée).''',
);
