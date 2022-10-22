import 'package:flutter/material.dart';

class ImageSelector extends StatefulWidget {
  final void Function(String) onImageSelected;

  const ImageSelector({Key key, this.onImageSelected}) : super(key: key);

  @override
  _ImageSelectorState createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Selector')),
      body: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (context, index) {
          final imageName = images[index];
          final isSelected = selectedIndex == index;
          return InkWell(
            onTap: () {
              if (isSelected) {
                setState(() {
                  selectedIndex = -1;
                });
                return;
              }
              setState(() {
                selectedIndex = index;
              });
              print('## Selected Image : $imageName');
            },
            child: Padding(
              padding: EdgeInsets.all(isSelected ? 5.0 : 0.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/$imageName',
                    fit: BoxFit.cover,
                  ),
                  if (isSelected)
                    Positioned(
                      top: 5.0,
                      left: 5.0,
                      child: CircleAvatar(
                        radius: 12.0,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.check,
                          size: 15.0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: selectedIndex > -1
          ? FloatingActionButton(
              child: Icon(Icons.check),
              onPressed: () {
                final selectedImage = images[selectedIndex];
                print('#### Selected Image : $selectedImage}');

                Navigator.pop(context);
                widget.onImageSelected(selectedImage);
              },
            )
          : null,
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
