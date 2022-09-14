import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hello,',
            style: TextStyle(fontSize: 24, color: Colors.black)),
        Text(
          'Samnang',
          style: TextStyle(
              color: ColorConst.yellow,
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
