import 'package:flutter/material.dart';
import 'package:mda_flutter_2022_01/main.dart';
import 'package:mda_flutter_2022_01/model.dart';

import 'image_selector_page.dart';

class CreateMenuPage extends StatefulWidget {
  final void Function(MenuData) onCreateMenu;

  const CreateMenuPage({
    Key? key,
    required this.onCreateMenu,
  }) : super(key: key);

  @override
  State<CreateMenuPage> createState() => _CreateMenuPageState();
}

class _CreateMenuPageState extends State<CreateMenuPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  String? mainImage;
  String? secondaryImage;

  final formKey = GlobalKey<FormState>();

  createMenuData() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    final title = titleController.text;
    final description = descriptionController.text;
    final price = int.parse(priceController.text);

    final menuData = MenuData(
        title: title,
        description: description,
        price: price,
        mainImage: mainImage!,
        secondaryImage: secondaryImage!,
    );
    print("$title, $description, $price, $mainImage, $secondaryImage");

    Navigator.pop(context);
    widget.onCreateMenu(menuData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creation de menu"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          // padding: const EdgeInsets.only(
          //     top: 40, left: 20, right: 20
          // ),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          children: [
            const Text("Titre", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8.0),
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
                if (value!.isEmpty) return 'Merci de saisir un titre';
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            const Text('Description', style: TextStyle(fontSize: 20.0)),
            const SizedBox(height: 5.0),
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
                if (value!.isEmpty) return 'Merci de saisir une description';
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            const Text("Prix", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8.0),
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
                if (value!.isEmpty) return 'Merci de saisir un titre';
                try {
                  int.parse(value);
                } catch (e) {
                  print(e);
                  return 'Merci de saisir un prix correct!';
                }

                return null;
              },
            ),
            const SizedBox(height: 30.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera),
              label: const Text("Image principale"),
              onPressed: () {
                navigateTo(context, ImageSelectorPage(
                  onImageSelected: (imageName) {
                    mainImage = imageName;
                    setState(() {});
                  },
                ));
              },
            ),
            const SizedBox(height: 5.0),
            if (mainImage != null) Image.asset(mainImage!),
            const SizedBox(height: 30.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera),
              label: const Text("Image secondaire"),
              onPressed: () {
                navigateTo(context, ImageSelectorPage(
                  onImageSelected: (imageName) {
                    secondaryImage = imageName;
                    setState(() {});
                  },
                ));
              },
            ),
            const SizedBox(height: 5.0),
            if (secondaryImage != null) Image.asset(secondaryImage!),
            const SizedBox(height: 50.0),
            ElevatedButton(
              child: const Text("Valider"),
              onPressed: (mainImage == null || secondaryImage == null)
                  ? null
                  : () {
                      createMenuData();
                    },
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
