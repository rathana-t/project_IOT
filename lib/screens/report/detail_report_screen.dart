import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_iot/map/order_traking.dart';
import 'package:project_iot/models/report_model.dart';
import 'package:project_iot/theme/colors.dart';
import 'package:project_iot/widgets/action_button.dart';

class DetailReport extends StatelessWidget {
  const DetailReport({Key? key, required this.item}) : super(key: key);

  final Report item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const Expanded(
                child: OrderTrackingPage(
                    destinationLocation: LatLng(11.555138, 104.893106),
                    justOneLocation: false),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: Text(
                          item.title,
                          style:
                              TextStyle(fontSize: 16, color: ColorConst.grey),
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(item.image)),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: ActionButton(
                          backgroundColor: ColorConst.yellow,
                          title: 'Save to Camera Roll',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              left: 20,
              top: 50,
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: ColorConst.yellow,
                    borderRadius: BorderRadius.circular(50)),
                child: InkWell(
                  onTap: () => Navigator.pop(context, true),
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )),
        ],
      ),
      // extendBody: true,
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: const BorderRadius.only(
      //     topRight: Radius.circular(40),
      //     topLeft: Radius.circular(40),
      //   ),
      //   child: Container(
      //     color: Colors.white,
      //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      //     child: Wrap(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      //           child: Text(
      //             item.title,
      //             style: TextStyle(fontSize: 16, color: ColorConst.grey),
      //           ),
      //         ),
      //         ClipRRect(
      //             borderRadius: BorderRadius.circular(14),
      //             child: Image.network(item.image)),
      //         Container(
      //           margin: const EdgeInsets.only(top: 20, bottom: 40),
      //           child: ActionButton(
      //             backgroundColor: ColorConst.yellow,
      //             title: 'Save to Camera Roll',
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
    // return Scaffold(
    //   // appBar: AppBar(
    //   //   title: Text(item.title),
    //   // ),
    //   body: Stack(
    //     children: [
    //       Expanded(
    //         child: Container(
    //           color: Colors.amber,
    //           alignment: Alignment.center,
    //           child: const Text('Map here'),
    //         ),
    //       ),
    //       Positioned(
    //           left: 20,
    //           top: 50,
    //           child: Container(
    //             padding: const EdgeInsets.all(7),
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(50)),
    //             child: InkWell(
    //               onTap: () => Navigator.pop(context, true),
    //               child: const Icon(
    //                 Icons.arrow_back_ios_outlined,
    //                 color: Colors.black,
    //                 size: 20,
    //               ),
    //             ),
    //           )),
    //     ],
    //   ),
    //   extendBody: true,
    //   bottomNavigationBar: ClipRRect(
    //     borderRadius: const BorderRadius.only(
    //       topRight: Radius.circular(40),
    //       topLeft: Radius.circular(40),
    //     ),
    //     child: Container(
    //       color: Colors.white,
    //       padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    //       child: Wrap(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
    //             child: Text(
    //               item.title,
    //               style: TextStyle(fontSize: 16, color: ColorConst.grey),
    //             ),
    //           ),
    //           ClipRRect(
    //               borderRadius: BorderRadius.circular(14),
    //               child: Image.network(item.image)),
    //           Container(
    //             margin: const EdgeInsets.only(top: 20, bottom: 40),
    //             child: ActionButton(
    //               backgroundColor: ColorConst.yellow,
    //               title: 'Save to Camera Roll',
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
