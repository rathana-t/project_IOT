import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../theme/colors.dart';
import '../devices/widgets/bottomsheet_card.dart';

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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: ColorConst.grey,
                elevation: 0,
                minimumSize: const Size.fromHeight(55),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Log Out',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

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
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 13),
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

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

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

class SimpleText extends StatelessWidget {
  const SimpleText({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: ColorConst.grey, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class AccountHeader extends StatelessWidget {
  const AccountHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                'https://img.freepik.com/premium-psd/3d-illustration-business-man-with-glasses_23-2149436193.jpg?w=740',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Samnang Bun',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorConst.yellow,
          ),
          child: IconButton(
            padding: const EdgeInsets.all(0.0),
            icon: const Icon(Icons.edit),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              showModalBottomSheet<void>(
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
