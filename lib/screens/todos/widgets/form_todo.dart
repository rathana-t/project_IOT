import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class FormTodo extends StatelessWidget {
  const FormTodo({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    required DatabaseReference databaseReference,
    this.value = '',
  })  : _formKey = formKey,
        _titleController = titleController,
        _descriptionController = descriptionController,
        _databaseReference = databaseReference,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _titleController;
  final TextEditingController _descriptionController;
  final DatabaseReference _databaseReference;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConst.yellow),
        backgroundColor: Colors.white,
        title: Text(
          '${value == '' ? 'Create' : 'Update'} Todo',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter update title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter update description';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorConst.yellow,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (value != '') {
                        _databaseReference
                            .child(value)
                            .set({
                              'title': _titleController.text,
                              'description': _descriptionController.text
                            })
                            .then((value) => Navigator.pop(context))
                            .catchError((onError) => print(onError));
                      } else {
                        _databaseReference.push().set({
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        }).then((value) => Navigator.pop(context));
                      }
                    }
                  },
                  child: const Text(
                    'Update Todo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
