import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmy_driver/core/services/services_locator.dart';
import 'package:pharmy_driver/cubit/location/location_cubit.dart';
import 'package:pharmy_driver/cubit/order/order_cubit.dart';
import 'package:pharmy_driver/models/params/tracking_params.dart';
import 'package:pharmy_driver/presentation/resources/assets_manager.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MapGoogle extends StatefulWidget {
  final String trackingUrl;
  final int id;
  final OrderCubit orderCubit;

  const MapGoogle({
    Key? key,
    required this.trackingUrl,
    required this.id,
    required this.orderCubit,
  }) : super(key: key);

  @override
  State<MapGoogle> createState() => _MapGoogleState();
}

class _MapGoogleState extends State<MapGoogle> {
  BitmapDescriptor? customIcon;
  Marker? markerLocation;
  late IO.Socket socket ;
  final List<Marker> _markers = <Marker>[];

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late final CameraPosition _kGooglePlex;

  @override
  void initState() {
    sl<LocationCubit>().getLatAndLng();
    _kGooglePlex = CameraPosition(
      target: LatLng(sl<LocationCubit>().lat, sl<LocationCubit>().lng),
      zoom: 14.4746,
    );
    connectAndListen();
    loadData();
    super.initState();
    // _loadCustomIcon();
  }

  @override
  void dispose() {
    socket.close();
    super.dispose();
  }

  // Future<void> _loadCustomIcon() async {
  //   customIcon = await BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(
  //       size: Size(1000, 1000),
  //     ),
  //     IconsManager.locationIcon,
  //   );
  //   setState(() {
  //     markerLocation = const Marker(
  //       // icon: customIcon!,
  //       markerId: MarkerId("1"),
  //       position: LatLng(33.5001811, 36.3325961),
  //       draggable: true,
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(33.33353973430781, 36.242,),
          zoom: 13.5,
        ),
        markers: Set<Marker>.of(_markers),
        // markers: {
          // Marker(
          //   markerId: const MarkerId("currentLocation"),
          //   position: LatLng(sl<LocationCubit>().lat, sl<LocationCubit>().lng),
          // ),
          // const Marker(
          //   markerId: MarkerId("destination"),
          //   position: destination,
          // ),
        // },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),

    );
  }

  //STEP2: Add this function in main function in main.dart file and add incoming data to the stream
  void connectAndListen() {
    TrackingParams params = TrackingParams(
      lat: sl<LocationCubit>().lat,
      long: sl<LocationCubit>().lng,
      status: "",
    );
    print('===============================');
    print(widget.trackingUrl);
    print(widget.id);
    print('===============================');
   socket = IO.io(
      widget.trackingUrl,
      OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.onConnect((_) {
      print('connect');
      socket.emit('track_${widget.id}', params.toJson());
    });

    socket.onDisconnect((_) => print('disconnect'));

    Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      sl<LocationCubit>().getLatAndLng();
      socket.emit(
        'track_${widget.id}',
        params.toJson(),
      );
    });
  }

  // declared method to get Images
  Future<Uint8List> getImages(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  // created method for displaying custom markers according to index
  loadData() async{
      final Uint8List markIcons = await getImages(IconsManager.locationIcon, 300);
      // makers added according to index
      _markers.add(
          Marker(
            // given marker id
            markerId: const MarkerId("aa"),
            // given marker icon
            icon: BitmapDescriptor.fromBytes(markIcons),
            // given position
            position:  const LatLng(33.33353973430781, 36.242,),
            // infoWindow: InfoWindow(
            //   // given title for marker
            //   title: 'Location: '+i.toString(),
            // ),
          )
      );
      setState(() {
      });

  }
}
