import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/screens/crashDetect/widgets/count_down.dart';
import 'package:project_iot/screens/crashDetect/widgets/crash_detect_title.dart';
import 'package:project_iot/theme/colors.dart';
import 'package:project_iot/widgets/action_button.dart';

class CrashDetectScreen extends StatefulWidget {
  const CrashDetectScreen({super.key});

  @override
  State<CrashDetectScreen> createState() => _CrashDetectScreenState();
}

class _CrashDetectScreenState extends State<CrashDetectScreen> {
  final int _duration = 150;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CrashDetectTitle(),
            CountDown(duration: _duration, controller: _controller),
            Column(
              children: [
                const Text(
                  'We have detected a heavy pressure',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                ActionButton(
                    backgroundColor: ColorConst.yellow,
                    title: "I'm Not Okay, SOS!",
                    onPressed: () => _controller.start()),
                const SizedBox(height: 15),
                ActionButton(
                    backgroundColor: ColorConst.grey,
                    title: "I'm Okay",
                    onPressed: () => _controller.pause()),
                const SizedBox(height: 15),
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

