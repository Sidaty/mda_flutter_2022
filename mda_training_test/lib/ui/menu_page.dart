import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mda_training_test/main.dart';
import 'package:mda_training_test/models/menu_item.dart';
import 'package:mda_training_test/models/users.dart';
import 'package:mda_training_test/ui/menu_item_card.dart';
import 'package:mda_training_test/ui/menu_item_page.dart';
import 'package:mda_training_test/ui/user_orders_page.dart';

import 'cart_page.dart';
import 'create_menu_page.dart';
import 'my_orders_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  onAddMenu(BuildContext context) {
    navigateTo(context, CreateMenuPage()).then((value) {
      setState(() {});
    });
  }

  onAddMenuItemToCart(BuildContext context, MenuItemData menuItem) {
    var menuItemCart = cart[menuItem.id];
    if (menuItemCart == null) {
      menuItemCart = MenuItemCart(menuItem: menuItem, quantity: 0);
      cart[menuItem.id] = menuItemCart;
    }
    menuItemCart.quantity++;

    setState(() {});
  }

  onRemoveMenuItemToCart(BuildContext context, MenuItemCart menuItemCart) {
    cart.remove(menuItemCart.menuItem.id);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Le Menu'),
        actions: [
          InkWell(
            onTap: () {
              navigateTo(
                context,
                CartPage(onRemoveMenuItemToCart: onRemoveMenuItemToCart),
              ).then((value) {
                setState(() {});
              });
            },
            child: MenuCart(),
          ),
          SizedBox(width: 10.0),
        ],
      ),
      drawer: AppDrawer(
        onAddMenu: onAddMenu,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        itemCount: menus.length,
        itemBuilder: (_, index) {
          final menuItem = menus[index];
          return InkWell(
            onTap: () => navigateTo(
              context,
              MenuItemPage(
                menuItem: menuItem,
                onAddMenuItemToCart: onAddMenuItemToCart,
              ),
            ),
            child: MenuItemCard(
              menuItem: menuItem,
              onAddMenuItemToCart: onAddMenuItemToCart,
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 30.0),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final void Function(BuildContext) onAddMenu;

  const AppDrawer({Key key, this.onAddMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            margin: const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.bottomLeft,
                image: AssetImage('assets/images/app-image.jpeg'),
              ),
            ),
            accountName: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(currentUser.fullName),
            ),
            accountEmail: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(currentUser.email),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/${currentUser.photoUrl}'),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              children: [
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.add)),
                  title: Text('Ajout un plat'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).pop();
                    onAddMenu(context);
                  },
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.shopping_bag_outlined)),
                  title: Text('Les commandes clients'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).pop();
                    navigateTo(context, UserOrdersPage());
                  },
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.shopping_basket_rounded)),
                  title: Text('Mes commandes'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).pop();
                    navigateTo(context, MyOrdersPage());
                  },
                ),
              ],
            ),
          ),
          Divider(color: Colors.black),
          Container(height: 50.0),
        ],
      ),
    );
  }
}

class MenuCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int totalQuantity =
        cart.values.map((e) => e.quantity).fold(0, (x, y) => x + y);
    return Stack(
      children: [
        CircleAvatar(
          child: Icon(Icons.shopping_cart),
        ),
        Positioned(
          right: 0.0,
          top: 0.0,
          child: CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: Text(
              '${totalQuantity > 9 ? '+' : ''}${min(totalQuantity, 9)}',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
