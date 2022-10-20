import 'package:flutter/material.dart';

import 'create_menu_page.dart';
import 'page_detail.dart';

void main() {
  runApp(const MdaApp());
}

class MdaApp extends StatelessWidget {
  const MdaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: ListElement(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {},
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
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
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.add),),
                title: Text("Ajouter menu"),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return CreateMenuPage();
                      })
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ListElement extends StatelessWidget {
  final List<int> listElement = [3, 2, 1, 4, 5, 6, 10, 30, 7];

  ListElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listElement.length,
        itemBuilder: (context, index) {
          int element = listElement[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text('$element'),
            ),
            title: Text("Nom $element"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PageDetail(element);
              }));
            },
          );
        });
  }
}
