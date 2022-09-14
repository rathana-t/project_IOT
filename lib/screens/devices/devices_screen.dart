import 'package:flutter/material.dart';
import 'package:project_iot/screens/devices/widgets/device_header.dart';
import 'package:project_iot/screens/home/widgets/device_card.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: DeviceHeader(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            DeviceCard(
              removeTitle: true,
              backG: Colors.white,
              padding: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
