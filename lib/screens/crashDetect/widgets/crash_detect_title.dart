
import 'package:flutter/material.dart';

class CrashDetectTitle extends StatelessWidget {
  const CrashDetectTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Text(
            'Crash Detected',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Count Down',
              style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}