import 'package:flutter/material.dart';
import 'package:project_iot/dummyData/report_dummy.dart';
import 'package:project_iot/models/report_model.dart';
import 'package:project_iot/screens/report/widgets/report_card.dart';
import 'package:project_iot/screens/report/widgets/report_header.dart';
import 'package:project_iot/theme/colors.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 0, 5),
            child: ReportHeader(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: ListView(
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: const [
            ReportListView(),
          ],
        ),
      ),
    );
  }
}

class ReportListView extends StatelessWidget {
  const ReportListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Reports> reports = reportList;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: reports.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reports[index].date,
                    style: TextStyle(fontSize: 24, color: ColorConst.grey)),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: reports[index].reportList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ReportCard(item: reports[index].reportList[index]);
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
