import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard(
      {Key? key,
      this.padding = 23.0,
      required this.backG,
      this.removeTitle = false})
      : super(key: key);
  final double padding;
  final Color backG;
  final bool removeTitle;

  @override
  Widget build(BuildContext context) {
    var title = Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: Text(
        'Connected Device (1)',
        style: TextStyle(fontSize: 18, color: ColorConst.grey),
      ),
    );
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: backG,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            removeTitle ? const SizedBox() : title,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                    const Text('Icam pro', style: TextStyle(fontSize: 18)),
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
                    Row(
                      children: [
                        RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.battery_0_bar,
                            color: ColorConst.grey,
                          ),
                        ),
                        Text(
                          'Battery 68%',
                          style: TextStyle(color: ColorConst.grey),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
