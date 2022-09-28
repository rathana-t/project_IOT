import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class AccountHeader extends StatefulWidget {
  const AccountHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountHeader> createState() => _AccountHeaderState();
}

class _AccountHeaderState extends State<AccountHeader> {
  late String userName = 'N/A';
  late String recording = 'null';
  late bool fetching = false;

  @override
  void initState() {
    fetchUser();
    // final DatabaseReference queryRecording =
    //     FirebaseDatabase.instance.ref().child('users');
    // queryRecording.onValue.listen((DatabaseEvent event) {
    //   setState(() {
    //     userName = event.snapshot.child('name').value.toString();
    //   });
    // });
    fetchRecordStatus();
    super.initState();
  }

  void fetchUser() async {
    // Future<void> fetchUser() async {
    // final user = FirebaseAuth.instance.currentUser;

    // if (user != null) {
    //   final DatabaseReference query =
    //       // FirebaseDatabase.instance.ref().child('users').child(user.uid);
    //       FirebaseDatabase.instance.ref().child('users');
    //   final snapshot = await query.get();

    //   setState(() {
    //     userName = snapshot.child('name').value.toString();
    //   });
    // }
    final DatabaseReference queryRecording =
        FirebaseDatabase.instance.ref().child('users');
    queryRecording.onValue.listen((DatabaseEvent event) {
      setState(() {
        userName = event.snapshot.child('name').value.toString();
      });
    });
  }

  void fetchRecordStatus() async {
    setState(() {
      fetching = true;
    });
    final DatabaseReference queryRecording =
        FirebaseDatabase.instance.ref().child('test');
    final snapshot = await queryRecording.get();
    if (recording != 'null') {
      if (snapshot.child('startCamera').value.toString() == '0') {
        await queryRecording.child('startCamera').set(1);
      } else if (snapshot.child('startCamera').value.toString() == '1') {
        await queryRecording.child('startCamera').set(0);
      }
    }
    final latestSnapshot = await queryRecording.get();
    setState(() {
      recording = latestSnapshot.child('startCamera').value.toString();
      fetching = false;
    });
  }

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
            Text(
              userName,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: recording == '0' ? ColorConst.yellow : ColorConst.grey,
          ),
          child: TextButton(
            child: Text(
              fetching
                  ? 'loading...'
                  : recording == '0'
                      ? 'Start record'
                      : "Stop record",
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (fetching == false) {
                fetchRecordStatus();
                // setState(() {
                //   fetching = true;
                // });
              }

              // if (fetching) {
              // }
            },
          ),
          // child: IconButton(
          //   // padding: const EdgeInsets.all(0.0),
          //   icon: const Icon(Icons.edit),
          //   iconSize: 30,
          //   color: Colors.white,
          //   onPressed: () async {
          //     // await showModalBottomSheet<void>(
          //     //   shape: const RoundedRectangleBorder(
          //     //     borderRadius: BorderRadius.vertical(
          //     //       top: Radius.circular(50.0),
          //     //     ),
          //     //   ),
          //     //   context: context,
          //     //   builder: (BuildContext context) {
          //     //     return const BottomSheetCard();
          //     //   },
          //     // );
          //   },
          // ),
        )
      ],
    );
  }
}
