import 'package:flutter/material.dart';

class ReportHeader extends StatelessWidget {
  const ReportHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Report',
        style: TextStyle(
            fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold));
  }
}
