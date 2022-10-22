import 'package:flutter/material.dart';

import 'model.dart';

class ShoppingCartPage extends StatefulWidget {
  final List<CartItemData> items;
  final void Function(MenuData) addItem;
  final void Function(MenuData) removeItem;

  const ShoppingCartPage(
    this.items, {
      required this.addItem,
      required this.removeItem,
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier"),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(item.menuData.mainImage),
            ),
            title: Text(item.menuData.title),
            subtitle: Row(
              children: [
                Text("${item.count}"),
                const SizedBox(width: 10),
                const Text("x"),
                const SizedBox(width: 10),
                Text("${item.menuData.price}"),
                const SizedBox(width: 10),
                const Text("="),
                const SizedBox(width: 10),
                Text("${item.totalPrice}"),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {
                  widget.addItem(item.menuData);
                  setState(() {});
                }, icon: const Icon(Icons.add)),
                IconButton(onPressed: () {
                  widget.removeItem(item.menuData);
                  setState(() {});
                }, icon: const Icon(Icons.remove)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Chip(
            backgroundColor: Colors.orangeAccent,
            label: Text(
                "${widget.items.map((e) => e.totalPrice).reduce((x, y) => x + y)} F"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Valider"),
          ),
        ],
      ),
    );
  }
}
