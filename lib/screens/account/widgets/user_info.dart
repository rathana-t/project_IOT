import 'package:flutter/material.dart';
import 'package:project_iot/models/user_model.dart';
import 'package:project_iot/screens/account/widgets/simple_text.dart';

class UserInfoCard extends StatelessWidget {
  UserInfoCard({Key? key}) : super(key: key);

  final User user = User(
      age: "23 years",
      gender: "23 years",
      weight: "65 kg",
      bloodType: "AB+",
      height: "180 kg");
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SimpleText(
            title: 'Age',
            value: user.age,
          ),
          SimpleText(
            title: 'Gender',
            value: user.gender,
          ),
          SimpleText(
            title: 'Weight',
            value: user.weight,
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SimpleText(
            title: 'Blood Type',
            value: user.bloodType,
          ),
          SimpleText(
            title: 'Height',
            value: user.height,
          ),
          SimpleText(
            title: 'Height',
            value: user.height,
          ),
        ],
      ),
    ]);
  }
}
