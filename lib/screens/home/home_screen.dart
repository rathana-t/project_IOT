import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_iot/dummyData/report_dummy.dart';
import 'package:project_iot/screens/home/widgets/device_card.dart';
import 'package:project_iot/screens/home/widgets/home_header.dart';
import 'package:project_iot/screens/home/widgets/recent_accident_card.dart';
import 'package:project_iot/theme/colors.dart';
import 'package:project_iot/screens/report/widgets/report_card.dart';

import '../../models/report_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: HomeHeader(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: ListView(
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            DeviceCard(backG: ColorConst.lightGrey),
            const SizedBox(height: 30),
            const RecentAccidentCard(),
            const SizedBox(height: 20),
            const VideoList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class VideoList extends StatelessWidget {
  const VideoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Report> items = reports;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ReportCard(item: items[index]);
        },
      ),
    );
  }
}
