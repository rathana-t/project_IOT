import 'package:flutter/material.dart';
import 'package:project_iot/screens/devices/widgets/bottomsheet_card.dart';
import 'package:project_iot/theme/colors.dart';

class DeviceHeader extends StatelessWidget {
  const DeviceHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Manage', style: TextStyle(fontSize: 24, color: Colors.black)),
            Text(
              'Devices',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: IconButton(
            padding: const EdgeInsets.all(0.0),
            icon: const Icon(Icons.add_box_rounded),
            iconSize: 50,
            color: ColorConst.yellow,
            onPressed: () {
              showModalBottomSheet<void>(
                // isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50.0),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return const BottomSheetCard();
                },
              );
            },
          ),
        )
      ],
    );
  }
}
