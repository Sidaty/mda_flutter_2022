import 'package:flutter/material.dart';
import 'package:mda_training_test/models/user_order.dart';
import 'package:mda_training_test/ui/user_order_card.dart';

class UserOrdersPage extends StatefulWidget {
  @override
  _UserOrdersPageState createState() => _UserOrdersPageState();
}

class _UserOrdersPageState extends State<UserOrdersPage>
    with SingleTickerProviderStateMixin<UserOrdersPage> {
  TabController tabController;

  userOrderAction(
    BuildContext context,
    UserOrder userOrder,
    UserOrderStatus nextStatus,
  ) {
    setState(() {
      userOrder.orderStatus = nextStatus;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les commandes clients'),
        actions: [
          CircleAvatar(child: Icon(Icons.shopping_bag_outlined)),
          SizedBox(width: 10.0),
        ],
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: [
            Tab(
              icon: Icon(Icons.new_releases_outlined),
              child: Text('Nouvelles'),
            ),
            Tab(
              icon: Icon(Icons.workspaces_outline),
              child: Text('En preparation'),
            ),
            Tab(
              icon: Icon(Icons.check),
              child: Text('Pretes'),
            ),
            Tab(
              icon: Icon(Icons.delivery_dining),
              child: Text('En livraison'),
            ),
            Tab(
              icon: Icon(Icons.thumb_up),
              child: Text('Livrees'),
            ),
          ],
        ),
      ),
      body: buildTabContents(context),
    );
  }

  Widget buildTabContents(BuildContext context) {
    print('#### orders : ${orders.length}');
    return TabBarView(
      controller: tabController,
      children: [
        buildOrderList(
          context,
          UserOrderStatus.initial,
          'En preparation',
          nextStatus: UserOrderStatus.inProcess,
        ),
        buildOrderList(
          context,
          UserOrderStatus.inProcess,
          'Prête',
          nextStatus: UserOrderStatus.ready,
        ),
        buildOrderList(
          context,
          UserOrderStatus.ready,
          'En livraison',
          nextStatus: UserOrderStatus.inDelivery,
        ),
        buildOrderList(
          context,
          UserOrderStatus.inDelivery,
          'Livée',
          nextStatus: UserOrderStatus.delivered,
        ),
        buildOrderList(context, UserOrderStatus.delivered, ''),
      ],
    );
  }

  Widget buildOrderList(
    BuildContext context,
    UserOrderStatus status,
    String actionLabel, {
    UserOrderStatus nextStatus,
  }) {
    final _orders = orders
        .where(
          (order) => order.orderStatus == status,
        )
        .toList();
    print('Status : $status, Size : ${_orders.length}');
    return ListView.separated(
      itemCount: _orders.length,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      itemBuilder: (context, index) {
        final userOrder = _orders[index];
        return UserOrderCard(
          userOrder: userOrder,
          actionLabel: actionLabel,
          onAction: nextStatus == null
              ? null
              : () => userOrderAction(
                    context,
                    userOrder,
                    nextStatus,
                  ),
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 20.0),
    );
  }
}
