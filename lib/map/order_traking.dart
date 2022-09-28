import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project_iot/map/constrants.dart';
import 'package:project_iot/theme/colors.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage(
      {Key? key,
      this.justOneLocation = true,
      required this.destinationLocation})
      : super(key: key);
  // double latitude, double longitude

  final LatLng destinationLocation;
  final bool justOneLocation;

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  // static const LatLng sourceLocation = LatLng(11.540649, 104.908969);
  // static const LatLng destinationLocation = LatLng(11.546159, 104.896217);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  PolylinePoints polylinePoints = PolylinePoints();

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((value) {
      currentLocation = value;
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((event) {
      currentLocation = event;

      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: widget.justOneLocation
                ? widget.destinationLocation
                : LatLng(
                    currentLocation!.latitude!, currentLocation!.longitude!),
            zoom: 13,
          ),
        ),
      );

      setState(() {});
    });
  }

  void getPolyPoints() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
      // PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(widget.destinationLocation.latitude,
          widget.destinationLocation.longitude),
    );

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));

      setState(() {});
    }
  }

  void setCustomMarker() {
    // void setCustomMarker() async {
    print('setCustomMarker');
    // sourceIcon = await BitmapDescriptor.fromAssetImage(
    // //     const ImageConfiguration(size: Size(20, 20)), 'assets/images/source.png');
    // // destinationIcon = await BitmapDescriptor.fromAssetImage(
    // //     const ImageConfiguration(size: Size(20, 20)),
    // //     'assets/images/destination.png');
    // currentIcon = await BitmapDescriptor.fromAssetImage(
    //     const ImageConfiguration(size: Size(20, 20)),
    //     'assets/images/current.png');
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setCustomMarker();
      getCurrentLocation();
      getPolyPoints();
    });
    // getCurrentLocation();
    // getPolyPoints();
    // setCustomMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$currentLocation'),
      ),
      body: currentLocation == null && !widget.justOneLocation
          ? const Center(child: Text('Loading...'))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: widget.justOneLocation
                    ? widget.destinationLocation
                    : LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                zoom: 13.0,
              ),
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route'),
                  points: widget.justOneLocation ? [] : polylineCoordinates,
                  // statis points
                  // points: [
                  //   LatLng(11.540649, 104.908969),
                  //   LatLng(11.546159, 104.896217),
                  // ],
                  color: ColorConst.yellow,
                  width: 6,
                ),
              },
              markers: {
                if (!widget.justOneLocation)
                  Marker(
                    markerId: const MarkerId('currentLocation'),
                    position: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    icon: currentIcon,
                  ),
                // Marker(
                //   markerId: const MarkerId('source'),
                //   position: sourceLocation,
                //   icon: sourceIcon,
                // ),
                Marker(
                  markerId: const MarkerId('destination'),
                  position: widget.destinationLocation,
                  icon: destinationIcon,
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
    );
  }
}
