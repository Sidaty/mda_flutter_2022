import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mda_training_test/models/menu_item.dart';
import 'package:mda_training_test/models/user_order.dart';

class UserOrderCard extends StatelessWidget {
  final radius = 60.0;

  final String actionLabel;
  final UserOrder userOrder;
  final VoidCallback onAction;

  const UserOrderCard({
    Key key,
    this.onAction,
    this.userOrder,
    this.actionLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Column(
          children: [
            SizedBox(height: radius),
            buildUserOrderContent(context),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(
              'assets/images/${userOrder.user.photoUrl}',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildUserOrderContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 10.0,
            offset: Offset(2.0, 8.0),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: radius),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              userOrder.user.fullName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5.0),
                Text(
                  userOrder.user.address,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 5.0),
                Text(
                  userOrder.user.phone,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 180.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: userOrder.orderItems.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              separatorBuilder: (_, __) => SizedBox(width: 15.0),
              itemBuilder: (context, index) {
                final orderItem = userOrder.orderItems[index];
                return OrderItemCard(orderItem: orderItem);
              },
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                width: double.maxFinite,
                child: Text(actionLabel),
              ),
              onPressed: onAction,
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}

class OrderItemCard extends StatelessWidget {
  final MenuItemCart orderItem;

  const OrderItemCard({Key key, this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/${orderItem.menuItem.mainImage}'))),
                ),
              ),
              SizedBox(height: 10.0),
              Text(orderItem.menuItem.title),
              SizedBox(height: 10.0),
            ],
          ),
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: CircleAvatar(
            radius: 18.0,
            backgroundColor: Colors.white,
            child: Text('${orderItem.quantity}'),
          ),
        ),
      ],
    );
  }
}
