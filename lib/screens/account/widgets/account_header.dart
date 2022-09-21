
import 'package:flutter/material.dart';
import 'package:project_iot/screens/devices/widgets/bottomsheet_card.dart';
import 'package:project_iot/theme/colors.dart';

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
