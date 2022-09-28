import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_iot/main.dart';
import 'package:project_iot/theme/colors.dart';
import 'package:project_iot/widgets/action_button.dart';
import 'package:project_iot/widgets/input_form.dart';
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
        _databaseReference.set({
          'name': _nameController.text.trim(),
          'phone': _phoneController.text.trim(),
          'email': _emailController.text.trim(),
        // _databaseReference.child(FirebaseAuth.instance.currentUser!.uid).set({
        //   'id': FirebaseAuth.instance.currentUser!.uid,
        //   'name': _nameController.text.trim(),
        //   'phone': _phoneController.text.trim(),
        //   'email': _emailController.text.trim(),

          // 'contact': {'name': 'sdds', 'phone': 233323232}
        });
      } on FirebaseAuthException catch (e) {
        print(e);

        Utils.showSnackBar(e.message!);
      }

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    'Welcome back',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  InputForm(
                    controller: _nameController,
                    hintText: "Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
                  InputForm(
                    controller: _phoneController,
                    hintText: "Phone number",
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
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }),
                  InputForm(
                    controller: _passwordController,
                    hintText: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  InputForm(
                    controller: _confirmPassController,
                    hintText: 'Confirm Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a confirm password';
                      } else if (value != _passwordController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ActionButton(
                    title: "Register",
                    onPressed: register,
                    backgroundColor: ColorConst.yellow,
                  ),
                  const SizedBox(height: 20),
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
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )),
      ),
    );
  }
}
