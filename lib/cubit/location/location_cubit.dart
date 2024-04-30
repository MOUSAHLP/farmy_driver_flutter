import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmy_driver/cubit/location/location_states.dart';
import 'dart:async';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(InitialLocationState());

  static LocationCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  late Position cl;
   double lat=33;
    double lng = 36;
  late CameraPosition _kGooglePlex;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Future<void> getLatAndLng() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    Position cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    lng = cl.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 10.4746,
    );
  }
}
