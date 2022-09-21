import 'package:flutter/material.dart';
import 'package:project_iot/models/user_model.dart';
import 'package:project_iot/theme/colors.dart';

class EmergencyContactList extends StatelessWidget {
  const EmergencyContactList({
    Key? key,
    required this.emergencyContacts,
  }) : super(key: key);

  final List<EmergencyContact> emergencyContacts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Emergency Contact',
            style: TextStyle(fontSize: 22, color: ColorConst.grey)),
        const SizedBox(height: 10),
        ListView.builder(
            itemCount: emergencyContacts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConst.lightGrey,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          emergencyContacts[index].parent,
                          style:
                              TextStyle(fontSize: 18, color: ColorConst.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(emergencyContacts[index].phone,
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorConst.yellow,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
              );
            }),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 13, top: 5),
              child: Icon(Icons.warning, color: ColorConst.grey),
            ),
            Expanded(
              child: Text(
                'Emergency contacts will received a message a about your current location when you had an accident.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: ColorConst.grey,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
