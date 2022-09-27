import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_iot/screens/account/account_screen.dart';
import 'package:project_iot/screens/main_screen.dart';
import 'package:project_iot/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainScreen())));
    Timer(
        const Duration(seconds: 7),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AccountScreen())));
    // MaterialPageRoute(builder: (context) => MapSample())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              width: 400,
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/splash.png'),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "ICam",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorConst.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Safty roud, Safe travel',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ColorConst.yellow),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
