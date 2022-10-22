import 'package:flutter/material.dart';
import 'package:mda_training_test/models/menu_item.dart';
import 'package:mda_training_test/models/user_order.dart';
import 'package:mda_training_test/models/users.dart';
import 'package:mda_training_test/ui/menu_page.dart';

class CartPage extends StatefulWidget {
  final void Function(BuildContext, MenuItemCart) onRemoveMenuItemToCart;

  const CartPage({Key key, this.onRemoveMenuItemToCart}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  validatePayment(BuildContext context) {
    final _cart = cart.values.toList();
    final totalAmount = _cart.map((e) => e.totalPrice).fold(0, (x, y) => x + y);
    final userOrder = UserOrder(
      user: currentUser,
      createdDate: DateTime.now(),
      totalAmount: totalAmount,
      orderItems: _cart,
      orderStatus: UserOrderStatus.initial,
    );

    orders.add(userOrder);
    cart.clear();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final _cart = cart.values.toList();
    final totalAmount = _cart.map((e) => e.totalPrice).fold(0, (x, y) => x + y);
    return Scaffold(
      appBar: AppBar(title: Text('Panier')),
      body: ListView.separated(
        itemCount: cart.length,
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        itemBuilder: (context, index) {
          final menuItemCart = _cart[index];
          return Dismissible(
            key: ValueKey('${menuItemCart.menuItem.id}'),
            onDismissed: (direction) {
              widget.onRemoveMenuItemToCart(context, menuItemCart);
              setState(() {});
            },
            background: Container(
              color: Colors.red,
              child: Row(
                children: [
                  SizedBox(width: 5.0),
                  Icon(Icons.delete),
                  Spacer(),
                  Icon(Icons.delete),
                  SizedBox(width: 5.0),
                ],
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(
                  'assets/images/${menuItemCart.menuItem.mainImage}',
                ),
              ),
              title: Text('${menuItemCart?.menuItem?.title}'),
              subtitle: Text('${menuItemCart?.menuItem?.description}', maxLines: 2, overflow: TextOverflow.ellipsis,),
              trailing: RawChip(
                backgroundColor: Theme.of(context).primaryColor,
                label: Text(
                  '${menuItemCart.totalPrice} F',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return Divider(
              indent: 90.0, color: Colors.deepOrange, endIndent: 20.0);
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: Theme.of(context).primaryColor),
          Container(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 10.0, bottom: 20.0),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  child: Text(
                    'Valider',
                    style: TextStyle(
                      fontSize: 18.0,
                      // color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  onPressed: () {
                    validatePayment(context);
                  },
                )),
                SizedBox(width: 20.0),
                RawChip(
                  label: Text(
                    '$totalAmount F',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
