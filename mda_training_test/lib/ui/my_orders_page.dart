import 'package:flutter/material.dart';
import 'package:mda_training_test/models/user_order.dart';
import 'package:mda_training_test/ui/user_order_card.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes commandes'),
        actions: [
          CircleAvatar(child: Icon(Icons.shopping_bag_outlined)),
          SizedBox(width: 10.0),
        ],
      ),
      body: buildOrderList(context),
    );
  }

  Widget buildOrderList(BuildContext context) {
    final ordersDesc = orders..sort((x, y) => -x.createdDate.compareTo(y.createdDate));

    return ListView.separated(
      itemCount: ordersDesc.length,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      itemBuilder: (context, index) {
        final userOrder = ordersDesc[index];
        return UserOrderCard(
          userOrder: userOrder,
          actionLabel: statusToLabel(userOrder),
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 20.0),
    );
  }

  String statusToLabel(UserOrder userOrder) {
    switch(userOrder.orderStatus) {
      case UserOrderStatus.initial:
        return 'Nouvelle commande';
      case UserOrderStatus.inProcess:
        return 'En preparation';
      case UserOrderStatus.ready:
        return 'Prete';
      case UserOrderStatus.inDelivery:
        return 'En livraison';
      case UserOrderStatus.delivered:
        return 'Livrée';
    }
    return 'Inconnu';
  }
}
