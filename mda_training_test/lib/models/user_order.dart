import 'package:mda_training_test/models/menu_item.dart';
import 'package:mda_training_test/models/users.dart';

enum UserOrderStatus {
  initial,
  inProcess,
  ready,
  inDelivery,
  delivered
}

class UserOrder {
  User user;
  DateTime createdDate;
  List<MenuItemCart> orderItems;
  int totalAmount;
  UserOrderStatus orderStatus;

  UserOrder({
    this.user,
    this.createdDate,
    this.orderItems,
    this.totalAmount,
    this.orderStatus,
  });

}

final orders = <UserOrder>[];