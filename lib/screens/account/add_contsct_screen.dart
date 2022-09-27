import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/main.dart';
import 'package:project_iot/theme/colors.dart';
import 'package:project_iot/widgets/input_form.dart';

import '../../widgets/utils.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final query = FirebaseDatabase.instance.ref().child('users');

    Future addContact() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(child: CircularProgressIndicator());
          });

      try {
        // update add new file to user
        query
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child('contacts')
            .push()
            .set({
          'name': _nameController.text.trim(),
          'phone': _phoneController.text.trim(),
          'email': _emailController.text.trim(),
        });
      } on FirebaseAuthException catch (e) {
        print(e);
        Utils.showSnackBar(e.message!);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      appBar: AppBar(
        // set color app bar
        backgroundColor: ColorConst.yellow,
        title: const Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Column(
            children: [
              InputForm(
                controller: _nameController,
                hintText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              InputForm(
                controller: _phoneController,
                hintText: 'Phone number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  } else if (value.length < 9 || value.length > 10) {
                    return 'Please enter valid phone number';
                  }
                  return null;
                },
              ),
              InputForm(
                controller: _emailController,
                hintText: 'Email',
                // textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  } else if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email';
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  addContact();
                },
                child: const Text("Add Contact"),
              ),
              // create sign up button
            ],
          ),
        )),
      ),
    );
  }
}
