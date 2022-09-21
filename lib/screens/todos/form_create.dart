import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/screens/todos/widgets/form_todo.dart';

class FormCreateTodo extends StatefulWidget {
  const FormCreateTodo({Key? key}) : super(key: key);
  final String title = 'Create Todo';

  @override
  State<FormCreateTodo> createState() => _FormCreateTodoState();
}

class _FormCreateTodoState extends State<FormCreateTodo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final _databaseReference = FirebaseDatabase.instance.ref().child('todos');

  // late DatabaseReference _databaseReference;

  // @override
  // void initState() {
  //   super.initState();
  //   _titleController = TextEditingController();
  //   _descriptionController = TextEditingController();
  //   // _databaseReference = FirebaseDatabase.instance.ref().child('todos');
  // }

  @override
  Widget build(BuildContext context) {
    return FormTodo(
      formKey: _formKey,
      titleController: _titleController,
      descriptionController: _descriptionController,
      databaseReference: _databaseReference,
    );
  }
}
