import 'package:flutter/material.dart';
import 'package:project_iot/screens/account/widgets/account_header.dart';
import 'package:project_iot/screens/account/widgets/emergency_contact_list.dart';
import 'package:project_iot/screens/account/widgets/logout.dart';
import 'package:project_iot/screens/account/widgets/user_info.dart';

import '../../models/user_model.dart';
import '../../theme/colors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  User user = User(
      age: "23 years",
      gender: "23 years",
      weight: "65 kg",
      bloodType: "AB+",
      height: "180 kg");

  Widget build(BuildContext context) {
    List<EmergencyContact> emergencyContacts = [
      EmergencyContact(parent: "Mother", phone: "0123456789"),
      EmergencyContact(parent: "Father", phone: "0123456789"),
      EmergencyContact(parent: "Brother", phone: "0123456789"),
      EmergencyContact(parent: "Sister", phone: "0123456789"),
    ];

    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const AccountHeader(),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: ColorConst.lightGrey,
              ),
              child: UserInfo(user: user),
            ),
            const SizedBox(height: 20),
            EmergencyContactList(emergencyContacts: emergencyContacts),
            const SizedBox(height: 29),
            const LogOutButton(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
