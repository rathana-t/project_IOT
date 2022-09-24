
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class CountDown extends StatelessWidget {
  const CountDown({
    Key? key,
    required int duration,
    required CountDownController controller,
  }) : _duration = duration, _controller = controller, super(key: key);

  final int _duration;
  final CountDownController _controller;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: _duration,
      // initialDuration: 10,
      controller: _controller,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      ringColor: ColorConst.lightGrey,
      ringGradient: null,
      fillColor: ColorConst.yellow,
      fillGradient: null,
      // backgroundColor: Colors.purple[500],
      backgroundGradient: null,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
        fontSize: 50,
        color: ColorConst.yellow,
        fontWeight: FontWeight.bold,
      ),
      textFormat: CountdownTextFormat.S,
      isReverse: false,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: false,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        debugPrint('Countdown Ended');
      },
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
    );
  }
}
