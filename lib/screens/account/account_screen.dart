import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/screens/account/widgets/account_header.dart';
import 'package:project_iot/screens/account/widgets/emergency_contact_list.dart';
import 'package:project_iot/widgets/action_button.dart';
import 'package:project_iot/screens/account/widgets/user_info.dart';

import '../../models/user_model.dart';
import '../../theme/colors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // Object? emergencyContacts;

  List<EmergencyContact> emergencyContacts = [
    EmergencyContact(name: "Mother", phone: "0123456789"),
    EmergencyContact(name: "Father", phone: "0123456789"),
    EmergencyContact(name: "Brother", phone: "0123456789"),
    EmergencyContact(name: "Sister", phone: "0123456789"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
              child: UserInfoCard(),
            ),
            const SizedBox(height: 20),
            const EmergencyContactList(),
            // EmergencyContactList(emergencyContacts: emergencyContacts),
            const SizedBox(height: 29),
            ActionButton(
              backgroundColor: ColorConst.grey,
              title: 'Log Out',
              onPressed: () async => await FirebaseAuth.instance.signOut(),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
