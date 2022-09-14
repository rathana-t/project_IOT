import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_iot/screens/devices/widgets/device_card.dart';
import 'package:project_iot/theme/colors.dart';

class BottomSheetCard extends StatefulWidget {
  const BottomSheetCard({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetCard> createState() => _BottomSheetCardState();
}

class _BottomSheetCardState extends State<BottomSheetCard> {
  bool searching = true;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 3000),
        () => setState(() => searching = false));
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(!searching ? 'Connecting to' : 'Searching for',
                  style: const TextStyle(fontSize: 24, color: Colors.black)),
              const Text(
                'Device',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        if (searching)
          Expanded(
            child: SpinKitRipple(
              borderWidth: 2,
              size: 500,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Icon(
                    Icons.circle_outlined,
                    size: 410,
                    color: ColorConst.yellow,
                  ),
                );
              },
            ),
          ),
        if (searching)
          Positioned(
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorConst.yellow,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.bluetooth,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        if (!searching)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const LocalDeviceCard(),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: ColorConst.yellow,
                    elevation: 0,
                    minimumSize: const Size.fromHeight(55),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Connect',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
