import 'package:flutter/material.dart';
import 'package:mda_training_test/main.dart';
import 'package:mda_training_test/models/menu_item.dart';
import 'package:mda_training_test/ui/image_selector.dart';
import 'package:uuid/uuid.dart';

class CreateMenuPage extends StatefulWidget {
  @override
  _CreateMenuPageState createState() => _CreateMenuPageState();
}

class _CreateMenuPageState extends State<CreateMenuPage> {
  String mainImage;
  String secondaryImage;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  createMenuItem(BuildContext context) {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    final menuItem = MenuItemData(
      id: Uuid().v4(),
      title: titleController.text,
      description: descriptionController.text,
      price: int.parse(priceController.text),
      mainImage: mainImage,
      secondaryImage: secondaryImage,
    );

    menus.add(menuItem);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Creation de menu'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          children: [
            Text('Titre', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 5.0),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Titre',
                // labelText: 'Titre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) return 'Merci de saisir un titre';
                return null;
              },
            ),
            SizedBox(height: 20.0),
            Text('Description', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 5.0),
            TextFormField(
              minLines: 3,
              maxLines: null,
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                // labelText: 'Titre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) return 'Merci de saisir une description';
                return null;
              },
            ),
            SizedBox(height: 20.0),
            Text('Prix', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 5.0),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                hintText: 'Prix',
                // labelText: 'Titre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) return 'Merci de saisir un prix';
                try {
                  int.parse(value);
                } catch (e) {
                  return 'Merci de saisir un prix correct';
                }
                return null;
              },
              // onSaved: (value) {
              //   menuItem.price = int.parse(value);
              // },
            ),
            SizedBox(height: 40.0),
            ElevatedButton.icon(
              label: Text('Image Principale'),
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () {
                navigateTo(context, ImageSelector(
                  onImageSelected: (selectedImage) {
                    setState(() {
                      mainImage = selectedImage;
                    });
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
              ),
            ),
            if (mainImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset('assets/images/$mainImage'),
              ),
            SizedBox(height: 40.0),
            ElevatedButton.icon(
              label: Text('Image Secondaire'),
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () {
                navigateTo(context, ImageSelector(
                  onImageSelected: (selectedImage) {
                    setState(() {
                      secondaryImage = selectedImage;
                    });
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
              ),
            ),
            if (secondaryImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset('assets/images/$secondaryImage'),
              ),
            SizedBox(height: 50.0),
            Builder(builder: (context) {
              return ElevatedButton(
                child: Text(
                  'Creer',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () => createMenuItem(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
