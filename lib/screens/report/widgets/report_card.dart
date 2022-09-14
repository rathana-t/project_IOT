import 'package:flutter/material.dart';
import 'package:project_iot/screens/report/detail_report_screen.dart';
import 'package:project_iot/theme/colors.dart';

import '../../../models/report_model.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Report item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Text(
            item.title,
            style: TextStyle(fontSize: 16, color: ColorConst.grey),
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailReport(item: item)),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(item.image)),
        )
      ],
    );
  }
}
