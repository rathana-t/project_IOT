import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_iot/main.dart';
import 'package:project_iot/widgets/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.onClickLogin})
      : super(key: key);
  final VoidCallback onClickLogin;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _databaseReference = FirebaseDatabase.instance.ref().child('users');

  @override
  Widget build(BuildContext context) {
    Future register() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(child: CircularProgressIndicator());
          });

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        //.then((userCredential) {
        //   // userCredential.user.updateEmail('newyou@domain.example')
        // });
        _databaseReference.child(FirebaseAuth.instance.currentUser!.uid).set({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'name': _nameController.text.trim(),
          'phone': _phoneController.text.trim(),
          'email': _emailController.text.trim(),

          // 'contact': {'name': 'sdds', 'phone': 233323232}
        });
      } on FirebaseAuthException catch (e) {
        print(e);

        Utils.showSnackBar(e.message!);
      }

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 200),
            const Text('Welcome back'),
            TextFormField(
              controller: _nameController,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter name';
                return null;
              },
            ),
            TextFormField(
              controller: _phoneController,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  hintText: "Phone number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter phone number';
                } else if (value.length < 9 || value.length > 10) {
                  return 'Please enter valid phone number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                } else if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _confirmPassController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (value != _passwordController.text) {
                  return 'Password does not match';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                register();
              },
              child: const Text("Register"),
            ),
            // create sign up button
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickLogin,
                    text: 'Log In',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
