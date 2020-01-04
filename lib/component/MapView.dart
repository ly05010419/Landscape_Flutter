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
  Set<Marker> markers = {};
  bool _showGoogleMaps = false;
  LatLng latlng;

  @override
  void initState() {
    super.initState();

    latlng = LatLng(widget.landmark.latitude,
        widget.landmark.longitude);

    Future.delayed(const Duration(milliseconds: 250), () {
      setState(() {
        _showGoogleMaps = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showGoogleMaps
        ? GoogleMap(
            scrollGesturesEnabled: false,
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: false,
            rotateGesturesEnabled: false,
            markers: markers,
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: latlng,
              zoom: 7.5,
            ),
            onMapCreated: mapCreated,
          )
        : Container(
            color: Colors.grey[200],
          );
  }

  void mapCreated(GoogleMapController controller) {
    Marker marker = Marker(
        infoWindow: InfoWindow(title: widget.landmark.name),
        markerId: MarkerId(latlng.toString()),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: latlng);

    markers.add(marker);
    setState(() {});
  }
}
