import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/screens/account/add_contsct_screen.dart';
import 'package:project_iot/theme/colors.dart';

class EmergencyContactList extends StatelessWidget {
  const EmergencyContactList({
    Key? key,
    // required this.emergencyContacts,
  }) : super(key: key);

  // final Object emergencyContacts;
  // final List<EmergencyContact> emergencyContacts;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final DatabaseReference query =
        FirebaseDatabase.instance.ref().child('users').child('contacts');

    // final DatabaseReference query = FirebaseDatabase.instance
    //     .ref()
    //     .child('users')
    //     .child(user!.uid)
    //     .child('contacts');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Emergency Contact',
                style: TextStyle(fontSize: 22, color: ColorConst.grey)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorConst.yellow,
              ),
              child: IconButton(
                // padding: const EdgeInsets.all(0.0),
                icon: const Icon(Icons.group_add_rounded),
                iconSize: 30,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddContactScreen()));
                  // builder: (context) => const AddContactScreen()));
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        FirebaseAnimatedList(
            query: query,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
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
                          'N/A',
                          // snapshot.child('name').value.toString(),
                          style:
                              TextStyle(fontSize: 18, color: ColorConst.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(snapshot.value.toString().replaceAll('+855', '0'),
                            // Text(snapshot.child('phone').value.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorConst.yellow,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
              );
            }),
        // ListView.builder(
        //     itemCount: emergencyContacts.length,
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.only(bottom: 10),
        //         child: Container(
        //           width: double.infinity,
        //           padding: const EdgeInsets.all(10),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(12),
        //             color: ColorConst.lightGrey,
        //           ),
        //           child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   emergencyContacts[index].name,
        //                   style:
        //                       TextStyle(fontSize: 18, color: ColorConst.grey),
        //                 ),
        //                 const SizedBox(height: 5),
        //                 Text(emergencyContacts[index].phone,
        //                     style: TextStyle(
        //                         fontSize: 20,
        //                         color: ColorConst.yellow,
        //                         fontWeight: FontWeight.bold)),
        //               ]),
        //         ),
        //       );
        //     }),
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
