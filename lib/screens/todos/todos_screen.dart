import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/screens/todos/form_create.dart';
import 'package:project_iot/screens/todos/form_edit.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  static const KEY = "key";
  Widget build(BuildContext context) {
    final DatabaseReference _databaseReference =
        FirebaseDatabase.instance.ref().child('todos');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormCreateTodo()),
              );
            },
            icon: const Icon(Icons.create_new_folder_rounded),
          ),
        ],
      ),
      body: Center(
        child: FirebaseAnimatedList(
          query: _databaseReference,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            var refactor = snapshot.value
                .toString()
                .replaceAll(RegExp("{|}|title: |description: "), "");
            refactor.trim();

            var text = refactor.split(',');
            var title = text[1];
            var description = text[0];
            return Card(
              child: ListTile(
                title: Text(title),
                subtitle: Text(description),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _databaseReference
                              .child(snapshot.key.toString())
                              .remove();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormEditTodo(
                                value: snapshot.key.toString(),
                                des: description,
                                title: title,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
