import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as web;

class VanillaGoogleMap extends StatefulWidget {
  final Set<Marker> setOfMarkers;

  const VanillaGoogleMap({Key? key, required this.setOfMarkers})
      : super(key: key);

  @override
  State<VanillaGoogleMap> createState() => _VanillaGoogleMapState();
}

class _VanillaGoogleMapState extends State<VanillaGoogleMap> {
  final CameraPosition _initialPosition = const CameraPosition(
      target: LatLng(35.8714354, 128.601445), zoom: 12.0);
  late GoogleMapController _controller;
  GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance = web.GoogleMapsPlugin();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      mapType: MapType.normal,
      onMapCreated: (controller) => {_controller = controller},
      markers: widget.setOfMarkers,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
      // 클릭한 위치가 중앙에 표시
      onTap: (coordinate) {
        FocusScope.of(context).unfocus();
        _controller.animateCamera(CameraUpdate.newLatLng(coordinate));
      },
      cameraTargetBounds: CameraTargetBounds(
        LatLngBounds(
          southwest: const LatLng(35.03, 126.38),
          northeast: const LatLng(35.15, 127.00),
        ),
      ),
      minMaxZoomPreference: const MinMaxZoomPreference(12.0, 15.0),
    );
  }
}
