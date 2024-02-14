import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmy_driver/cubit/google_map/location_states.dart';
import 'dart:async';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(InitialLocationState());

  static LocationCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }
 var lat;
 var lng;

  Future<void> getLatAndLng() async {
    Position cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    lng = cl.longitude;
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 10.4746,
    );
    emit(RefreshState());
  }

  @override
  void initState() {
    getLatAndLng();
    emit(RefreshState());

    // Add code after super
  }
}