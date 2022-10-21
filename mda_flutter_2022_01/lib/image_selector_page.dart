import 'package:flutter/material.dart';

class ImageSelectorPage extends StatefulWidget {


  final void Function(String) onImageSelected;

  const ImageSelectorPage({required this.onImageSelected, Key? key}) : super(key: key);

  @override
  State<ImageSelectorPage> createState() => _ImageSelectorPageState();
}

class _ImageSelectorPageState extends State<ImageSelectorPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selection d'image"),
      ),
      body: GridView.builder(
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final imageName = images[index];
          final selected = selectedIndex == index;
          return InkWell(
            onTap: () {
              if (selectedIndex == index) {
                selectedIndex = -1;
              } else {
                selectedIndex = index;
              }
              setState(() {});
            },
            child: Stack(
              children: [
                Container(
                  margin: !selected ? null : const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/$imageName"),
                    ),
                  ),
                ),
                if (selected)
                  const Positioned(
                    left: 10.0,
                    top: 10.0,
                    child: Icon(Icons.check_circle, color: Colors.green),
                  ),
              ],
            ),
          );
        },
        padding: const EdgeInsets.all(20),
      ),
      floatingActionButton: selectedIndex == -1 ? null : FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          final imageName = images[selectedIndex];
          final absolutePath = "assets/images/$imageName";
          Navigator.of(context).pop();
          widget.onImageSelected(absolutePath);
        },
      ),
    );
  }
}

final images = [
  'pexels-photo-628776.jpeg',
  'pexels-photo-821365.jpeg',
  'pexels-photo-853006.jpeg',
  'pexels-photo-1092730.jpeg',
  'pexels-photo-1351238.jpeg',
  'pexels-photo-1410236.jpeg',
  'pexels-photo-1583884.jpeg',
  'pexels-photo-1640777.jpeg',
  'pexels-photo-3026805.jpeg',
  'pexels-photo-3186654.jpeg',
  'pexels-photo-3535383.jpeg',
  'pexels-photo-3756523.jpeg',
  'pexels-photo-3758053.jpeg',
];
