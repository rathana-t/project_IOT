import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_iot/main.dart';
import 'package:project_iot/screens/auth/forgetpassword/forget_password_screen.dart';
import 'package:project_iot/theme/colors.dart';
import 'package:project_iot/widgets/action_button.dart';
import 'package:project_iot/widgets/input_form.dart';
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
    Future logIn() async {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 150),
                const Text(
                  'Log In',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                const SizedBox(height: 50),
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
                const SizedBox(height: 10),
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
                // InputForm(
                //     controller: _emailController,
                //     hintText: "Email",
                //     keyboardType: TextInputType.emailAddress,
                //     validator: () {}),
                // InputForm(
                //     controller: _passwordController,
                //     hintText: "Password",
                //     validator: () {}),
                const SizedBox(height: 10),
                ActionButton(
                    title: 'Log In',
                    onPressed: logIn,
                    backgroundColor: ColorConst.yellow),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen()));
                  },
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 20),
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
                ),
                const SizedBox(height: 30),
              ],
            )),
      ),
    );
  }
}
