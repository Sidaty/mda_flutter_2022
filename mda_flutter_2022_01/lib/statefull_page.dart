import 'package:flutter/material.dart';


class StatefulPage extends StatefulWidget {
  const StatefulPage({Key? key}) : super(key: key);

  @override
  _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$counter",
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(
                child: Icon(Icons.add),
                onPressed: () {

                  counter++;

                  setState(() {
                  });
                },
            )
          ],
        ),
      ),
    );
  }
}
