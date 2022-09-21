import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/screens/todos/widgets/form_todo.dart';

class FormEditTodo extends StatefulWidget {
  const FormEditTodo(
      {Key? key, required this.value, required this.title, required this.des})
      : super(key: key);
  final String value;
  final String title;
  final String des;
  @override
  State<FormEditTodo> createState() => _FormEditTodoState();
}

class _FormEditTodoState extends State<FormEditTodo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  late DatabaseReference _databaseReference;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.des);
    _databaseReference = FirebaseDatabase.instance.ref().child('todos');
  }

  @override
  Widget build(BuildContext context) {
    return FormTodo(
        formKey: _formKey,
        titleController: _titleController,
        descriptionController: _descriptionController,
        databaseReference: _databaseReference,
        value: widget.value);
  }
}
