import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wwdcflutter/model/models.dart';

class MapView extends StatefulWidget {
  final Landmark landmark;
  MapView({Key key, this.landmark}) : super(key: key);

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    LatLng latlng = LatLng(widget.landmark.coordinates.latitude,
        widget.landmark.coordinates.longitude);

    return new Scaffold(
      body: GoogleMap(
        markers: markers,
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          target: latlng,
          zoom: 7.5,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

          Marker marker = Marker(
              infoWindow: InfoWindow(title: widget.landmark.name),
              markerId: MarkerId(latlng.toString()),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              position: latlng);

          markers.add(marker);

          setState(() {});
        },
      ),
    );
  }
}
