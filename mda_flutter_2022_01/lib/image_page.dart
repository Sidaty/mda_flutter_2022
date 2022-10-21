import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Image.asset(
                "assets/images/pexels-photo-1092730.jpeg"
            ),
            Image.network(
                "https://image.shutterstock.com/image-vector/mali-flag-vector-graphic-rectangle-260nw-1726561690.jpg"
            ),
            Image.network(
                "https://i.skyrock.net/3759/25643759/pics/747279675.jpg"
            ),
          ],
        ),
      ),
    );
  }
}
