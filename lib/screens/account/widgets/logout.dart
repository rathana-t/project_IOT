
import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: ColorConst.grey,
        elevation: 0,
        minimumSize: const Size.fromHeight(55),
      ),
      onPressed: () {
        // Navigator.pop(context);
      },
      child: const Text(
        'Log Out',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}