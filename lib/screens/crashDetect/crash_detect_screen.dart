import 'dart:developer';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/main.dart';
import 'package:project_iot/screens/crashDetect/widgets/count_down.dart';
import 'package:project_iot/screens/crashDetect/widgets/crash_detect_title.dart';
import 'package:project_iot/theme/colors.dart';
import 'package:project_iot/widgets/action_button.dart';
import 'package:project_iot/widgets/utils.dart';

class CrashDetectScreen extends StatefulWidget {
  const CrashDetectScreen({super.key});

  @override
  State<CrashDetectScreen> createState() => _CrashDetectScreenState();
}

class _CrashDetectScreenState extends State<CrashDetectScreen> {
  final int _duration = 120;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    final query = FirebaseDatabase.instance.ref().child('test');

    Future changeAction(bool okay) async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(child: CircularProgressIndicator());
          });

      try {
        if (okay) {
          await query.child('falseAlarmActive').set(false);
          await query.child('setOffAlarm').set(false);
        } else {
          await query.child('falseAlarmActive').set(false);
          await query.child('setOffAlarm').set(true);
        }
      } on FirebaseAuthException catch (e) {
        print(e);
        Utils.showSnackBar(e.message!);
      }

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: SizedBox(
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Crash',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                Text(
                  'Detected',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sending an alert to emergency service and contact in',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            // const CrashDetectTitle(),
            CountDown(
              duration: _duration,
              controller: _controller,
              onComplete: () {
                changeAction(false);
              },
            ),
            Column(
              children: [
                // const Text(
                //   'We have detected a heavy pressure',
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // ),
                const SizedBox(height: 15),
                ActionButton(
                    backgroundColor: Colors.white,
                    color: Colors.black,
                    title: "I'm Okay",
                    onPressed: () {
                      changeAction(true);
                      // _controller.pause();
                    }),
                const SizedBox(height: 15),
                ActionButton(
                  backgroundColor: ColorConst.yellow,
                  title: "Emergency Alert",
                  onPressed: () {
                    changeAction(false);
                    // _controller.start()
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   // crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     // const SizedBox(
      //     //   width: 30,
      //     // ),
      //     _button(
      //       title: "Start",
      //       onPressed: () => _controller.start(),
      //     ),
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     _button(
      //       title: "Pause",
      //       onPressed: () => _controller.pause(),
      //     ),
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     _button(
      //       title: "Resume",
      //       onPressed: () => _controller.resume(),
      //     ),
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     _button(
      //       title: "Restart",
      //       onPressed: () => _controller.restart(duration: _duration),
      //     ),
      //   ],
      // ),
    );
  }
}
