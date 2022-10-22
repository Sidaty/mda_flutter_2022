class MenuData {
  final int id;
  final String title;
  final String description;
  final int price;
  final String mainImage;
  final String secondaryImage;

  const MenuData({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.mainImage,
    required this.secondaryImage,
  });
}

class CartItemData {
  final int id;
  int count;
  final MenuData menuData;

  int get totalPrice => count * menuData.price;

  void increment() => count++;
  void decrement() => count--;

  CartItemData({
    required this.id,
    required this.count,
    required this.menuData,
  });
}
