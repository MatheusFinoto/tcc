import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(-20.96043773, -48.48285913);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("0101011"),
      position: LatLng(-20.95896495, -48.4846884),
      infoWindow: InfoWindow(
        title: 'Aqui está a casa',
        snippet: '5',
      ),
      icon: BitmapDescriptor.defaultMarker
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Maps Sample App'),
        backgroundColor: Color(0xfff2ede4),
      ),
      body: GoogleMap(
        markers: _markers,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 17,
        ),
      ),
    );
  }
}
