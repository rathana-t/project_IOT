import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class LocalDeviceCard extends StatelessWidget {
  const LocalDeviceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // removeTitle ? SizedBox() : title,
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/images/camera.png',
                width: 100,
                height: 100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Icam pro', style: TextStyle(fontSize: 24)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 16.5),
                  child: Text(
                    'Device connected',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConst.grey,
                    ),
                  ),
                ),
                Text(
                  'Share live location, camera',
                  style: TextStyle(fontSize: 16, color: ColorConst.grey),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
