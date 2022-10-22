import 'package:flutter/material.dart';
import 'package:mda_training_test/models/menu_item.dart';

class MenuItemPage extends StatefulWidget {
  final MenuItemData menuItem;
  final void Function(BuildContext, MenuItemData) onAddMenuItemToCart;

  const MenuItemPage({Key key, this.menuItem, this.onAddMenuItemToCart}) : super(key: key);

  @override
  _MenuItemPageState createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          '${widget.menuItem.title}',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(height: 350.0, width: double.maxFinite),
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      bottom: 100.0,
                      child: Hero(
                        tag: 'mainImage-${widget.menuItem.id}',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/${widget.menuItem.mainImage}',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Hero(
                        tag: 'secondaryImage-${widget.menuItem.id}',
                        child: Container(
                          height: 200.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/${widget.menuItem.secondaryImage}',
                                ),
                              ),
                              border: Border.all(
                                  color: Colors.white, width: 8.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${widget.menuItem.title}',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '${widget.menuItem.description}',
                        style: TextStyle(
                          fontSize: 20.0,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      RawChip(
                        backgroundColor:
                        Colors.deepOrangeAccent.withOpacity(.9),
                        label: Text(
                          '${widget.menuItem.price} F',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        child: Text(
                          'Ajouter au panir',
                          // style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => widget.onAddMenuItemToCart(context, widget.menuItem),
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shape: StadiumBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
