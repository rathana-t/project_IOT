import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/theme/colors.dart';

class AddFriendScreen extends StatefulWidget {
  const AddFriendScreen({Key? key}) : super(key: key);

  @override
  State<AddFriendScreen> createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final DatabaseReference _databaseReference =
        FirebaseDatabase.instance.ref().child('users');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Column(
          children: [
            AddContactAppBar(phoneController: _phoneController),
            const AddContactHeader(),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: FirebaseAnimatedList(
          // physics: const BouncingScrollPhysics(),
          query: _databaseReference,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            var name = snapshot.child('name').value;
            var phone = snapshot.child('phone').value;

            if (user!.uid == snapshot.key) {
              return const SizedBox();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(child: Text('$name')),
                    SizedBox(width: 10),
                    Expanded(child: Text('$phone')),
                    SizedBox(width: 10),
                    Container(
                      width: 80,
                      padding: EdgeInsets.only(right: 50),
                      child: IconButton(
                        onPressed: () {
                          // _databaseReference.child(snapshot.key.toString()).remove();
                        },
                        icon: Icon(
                          Icons.person_add,
                          color: ColorConst.yellow,
                        ),
                      ),
                    ),
                  ],
                ),
                // make a line device
                Container(
                  width: double.infinity,
                  height: 0.5,
                  color: ColorConst.grey,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AddContactAppBar extends StatelessWidget {
  const AddContactAppBar({
    Key? key,
    required TextEditingController phoneController,
  })  : _phoneController = phoneController,
        super(key: key);

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: ColorConst.yellow),
      elevation: 0,
      backgroundColor: Colors.white,
      title: SizedBox(
        height: 40,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          cursorColor: ColorConst.yellow,
          textInputAction: TextInputAction.search,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: 'Phone number',
            contentPadding: EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 2,
                color: ColorConst.yellow,
              ),
            ),
            // contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: ColorConst.grey,
              ),
            ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5),
            // ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_sharp,
              color: ColorConst.yellow,
            ),
          ),
        ),
      ],
    );
  }
}

class AddContactHeader extends StatelessWidget {
  const AddContactHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // padding: EdgeInsets.symmetric(horizontal: Metrics.instance.small),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorConst.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
              child: Text(
            'Name',
            style: TextStyle(color: ColorConst.grey),
          )),
          Expanded(
              child: Text(
            'Phone Number',
            style: TextStyle(color: ColorConst.grey),
          )),
          const SizedBox(width: 80),
        ],
      ),
    );
  }
}
