import 'package:flutter/material.dart';

class CreateMenuPage extends StatelessWidget {
  const CreateMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creation de menu"),
      ),
      body: ListView(
        // padding: const EdgeInsets.only(
        //     top: 40, left: 20, right: 20
        // ),
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        children: [
          Text("Titre", style: TextStyle(fontSize: 20)),
          SizedBox(height: 8.0),
          TextFormField(
            // controller: titleController,
            decoration: InputDecoration(
              hintText: 'Titre',
              // labelText: 'Titre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            // validator: (value) {
            //   if (value.isEmpty) return 'Merci de saisir un titre';
            //   return null;
            // },
          ),
          SizedBox(height: 20.0),
          Text('Description', style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 5.0),
          TextFormField(
            minLines: 3,
            maxLines: null,
            // controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Description',
              // labelText: 'Titre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            // validator: (value) {
            //   if (value.isEmpty) return 'Merci de saisir une description';
            //   return null;
            // },
          ),


          SizedBox(height: 20.0),
          Text("Prix", style: TextStyle(fontSize: 20)),
          SizedBox(height: 8.0),
          TextFormField(
            // controller: titleController,
            decoration: InputDecoration(
              hintText: 'Prix',
              // labelText: 'Titre',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            // validator: (value) {
            //   if (value.isEmpty) return 'Merci de saisir un titre';
            //   return null;
            // },
          ),
        ],
      ),
    );
  }
}
