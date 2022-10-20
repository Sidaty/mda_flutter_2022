import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final nameController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          const SizedBox(height: 50),

          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Nom",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
            ),
            onChanged: (e) {
              setState(() {});
            },
          ),

          const SizedBox(height: 20.0),

          TextFormField(
            controller: addressController,
            decoration: InputDecoration(
              hintText: "Adresse",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
            ),
            onChanged: (e) {
              setState(() {});
            },
          ),


        ],
      ),
    );
  }
}
