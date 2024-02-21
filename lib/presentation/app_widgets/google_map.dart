import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../resources/assets_manager.dart';

class Google_map extends StatefulWidget {
  Google_map({
    Key? key,
  }) : super(key: key);

  @override
  State<Google_map> createState() => _Google_mapState();
}
class _Google_mapState extends State<Google_map> {
  BitmapDescriptor? customIcon;
  Marker? markerLocation;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(33.5001811,  36.3325961),
    zoom: 14.4746,
  );
  @override
  void initState() {
    super.initState();
    _loadCustomIcon();
  }

  Future<void> _loadCustomIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(1000, 1000),
      ),
      IconsManager.locationIcon,
    );
    setState(() {
      markerLocation = Marker(
        icon: customIcon!,
        markerId: const MarkerId("1"),
        position: const LatLng(33.5001811, 36.3325961),
        draggable: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markerLocation != null ? {markerLocation!} : {}, // تحقق من وجود العلامة قبل إضافتها إلى الخريطة
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
