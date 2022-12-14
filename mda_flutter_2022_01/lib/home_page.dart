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
// description: "La pr??paration est de type been cin. Been cin signifie litt??ralement ?? une seule marmite ?? car le thiep se pr??pare avec une seule marmite (Niari cin signifie ?? deux marmites ?? et cette appellation d??signe les plats s??n??galais cuisin??s avec deux marmites l'un comprenant la sauce et l'autre le riz cuit ?? la vapeur qui l'accompagne).",
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
      'Le sushi est un plat traditionnel japonais, compos?? d\'un riz vinaigr?? appel?? shari combin?? avec un autre ingr??dient appel?? neta qui est habituellement du poisson cru ou des fruits de mer.',
);

const steakFrites = MenuData(
  price: 5000,
  id: 2,
  title: 'Steak frites',
  mainImage: 'assets/images/pexels-photo-3535383.jpeg',
  secondaryImage: 'assets/images/pexels-photo-1583884.jpeg',
  description:
      'Le steak frites est un plat fr??quemment servi en brasserie et dans les restaurants. ??tant le plat principal, il peut ??tre pr??c??d?? d\'une entr??e, et suivi de fromages et/ou desserts.',
);

const brochettesDeBoeuf = MenuData(
  price: 4500,
  id: 3,
  title: 'Brochettes de b??uf',
  mainImage: 'assets/images/pexels-photo-3026805.jpeg',
  secondaryImage: 'assets/images/pexels-photo-3756523.jpeg',
  description:
      '''Dans un grand bol, m??langer l???huile, la sauce soya, le vinaigre, la cassonade, le poivre et l???ail. Ajouter la viande et bien l???enrober. Couvrir et r??frig??rer 1 heure pour du filet mignon ou 24 heures pour de la bavette (voir note).
  ??goutter la viande et jeter la marinade. Enfiler les cubes de viande sur les brochettes. Laisser temp??rer la viande 15 minutes.
R??gler le barbecue ?? puissance ??lev??e. Huiler la grille.
Griller les brochettes 4 minutes de chaque c??t?? ou jusqu????? cuisson saignante ou ros??e. Saler l??g??rement (car la marinade est d??j?? sal??e).''',
);
