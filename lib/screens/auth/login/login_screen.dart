import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_iot/main.dart';
import 'package:project_iot/screens/auth/forgetpassword/forget_password_screen.dart';
import 'package:project_iot/widgets/utils.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key, required this.onClickRegister})
      : super(key: key);
  final VoidCallback onClickRegister;
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);

        Utils.showSnackBar(e.message!);
      }

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 200),
          TextField(
            controller: _emailController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          TextField(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              signIn();
            },
            child: const Text("Log In"),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ForgetPasswordScreen()));
            },
            child: const Text(
              "Forget Password?",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(height: 15),
          // create sign up button
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickRegister,
                  text: 'Register',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
