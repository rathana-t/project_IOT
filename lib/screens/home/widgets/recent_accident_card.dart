import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class RecentAccidentCard extends StatelessWidget {
  const RecentAccidentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text('Recent Accident', style: TextStyle(fontSize: 24))),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
              'https://cdn.vox-cdn.com/thumbor/rgnZj-wJtFBWeGIq4beR04GU-8M=/1400x788/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/19700731/googlemaps.png',
              width: double.infinity),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text('Accident reported at',
              style: TextStyle(fontSize: 16, color: ColorConst.grey)),
        ),
        const Text('NR6, Khan Chroy Changvar, Phnom Penh',
            style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
