import 'package:flutter/material.dart';

class ToDoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedToDo;

  const ToDoFormWidget({
    // Null safety
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedToDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        SizedBox(height: 6),
        buildDescription(),
        SizedBox(height: 40),
        buildSaveButton(),
      ],
    );
  }

  Widget buildTitle() {
    return TextFormField(
        cursorColor: Colors.red,
        maxLines: 2,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          // Null safety
          if (title!.isEmpty) {
            return 'Please enter a title';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ));
  }

  Widget buildDescription() {
    return TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescription,
        // // if required, add validator
        // validator: (description) {
        //   // Null safety
        //   if (description!.isEmpty) {
        //     return 'Please enter a description';
        //   } else {
        //     return null;
        //   }
        // },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ));
  }

  Widget buildSaveButton() {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Save'),
        onPressed: onSavedToDo,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      ),
    );
  }
}
