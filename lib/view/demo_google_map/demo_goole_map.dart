import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DemoGoogleMap extends StatefulWidget {
  const DemoGoogleMap({super.key});

  @override
  State<DemoGoogleMap> createState() => _DemoGoogleMapState();
}

class _DemoGoogleMapState extends State<DemoGoogleMap> {
  GoogleMapController? googleMapController;

  Marker initialMarker = const Marker(
    markerId: MarkerId('1'),
    position: LatLng(51.509865, -0.118092),
  );

  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(51.509865, -0.118092),
    zoom: 14.4746,
  );

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(51.509865, -0.118092),
      zoom: 14.4746,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        // onTap: (LatLng? latLong) async {
        //   log("LAt Long On Tap ::::::::::::::::::: latitude : ${latLong?.latitude} ::::::: longitude :${latLong?.longitude}");
        //
        //   setState(() {
        //     initialCameraPosition = CameraPosition(
        //       target: LatLng(latLong?.latitude ?? controller.latitude, latLong?.longitude ?? controller.longitude),
        //       zoom: 14.4746,
        //     );
        //
        //     initialMarker = Marker(
        //       markerId: const MarkerId('1'),
        //       position: LatLng(latLong?.latitude ?? controller.latitude, latLong?.longitude ?? controller.longitude),
        //       infoWindow: const InfoWindow(title: 'My Position'),
        //     );
        //
        //     googleMapController?.animateCamera(
        //       CameraUpdate.newCameraPosition(
        //         CameraPosition(
        //           target: LatLng(latLong?.latitude ?? controller.latitude, latLong?.longitude ?? controller.longitude),
        //           zoom: 18,
        //         ),
        //       ),
        //     );
        //   });
        //
        //   List<Placemark> address =
        //       await placemarkFromCoordinates(latLong?.latitude ?? controller.latitude, latLong?.longitude ?? controller.longitude);
        //
        //   log("On TAp Address :::::::::: ${address.first.toJson()}");
        //
        //   addressController.areaController.text = "${address.first.thoroughfare ?? ""},${address.first.subLocality ?? ""}";
        //   addressController.houseNoController.text = address.first.street ?? "";
        //   addressController.cityController.text = address.first.locality ?? "";
        //   addressController.stateController.text = address.first.administrativeArea ?? "";
        //   addressController.pinCodeController.text = address.first.postalCode ?? "";
        //
        //   controller.update();
        // },
        mapType: MapType.none,

        initialCameraPosition: initialCameraPosition,
        padding: EdgeInsets.zero,
        // markers: Set<Marker>.of(markersList),
        markers: {initialMarker},
        compassEnabled: true,
        zoomGesturesEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,

        onMapCreated: (GoogleMapController controllers) {
          googleMapController = controllers;
          setState(() {});
        },
      ),
    );
  }
}

/// ***********************************************************

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   final LatLng initialCenter = LatLng(37.7749, -122.4194);
//   final double initialZoom = 12.0;
//
//   GoogleMapController? _mapController;
//
//   List<LatLng> _polygonPoints = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize polygon points
//     _polygonPoints = _createPolygonPoints();
//   }
//
//   // Method to create initial polygon points
//   List<LatLng> _createPolygonPoints() {
//     return [
//       LatLng(37.7855, -122.4477),
//       LatLng(37.7603, -122.4573),
//       LatLng(37.7645, -122.4287),
//     ];
//   }
//
//   // Method to update polygon points when dragged
//   void _updatePolygonPoints(LatLng point, int index) {
//     setState(() {
//       _polygonPoints[index] = point;
//     });
//   }
//
//   // Method to handle map created event
//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _mapController = controller;
//     });
//   }
//
//   // Method to build the polygon on the map
//   Set<Polygon> _buildPolygons() {
//     return <Polygon>{
//       Polygon(
//         polygonId: PolygonId('editablePolygon'),
//         points: _polygonPoints,
//         strokeWidth: 2,
//         strokeColor: Colors.blue,
//         fillColor: Colors.blue.withOpacity(0.3),
//         onTap: () {
//           // Handle polygon tap if needed
//         },
//       ),
//     };
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Draggable Polygon Map'),
//       ),
//       body: Stack(
//         children: [
//           FlutterMap(
//             options: MapOptions(
//               center: initialCenter,
//               zoom: initialZoom,
//               onTap: (point) {
//                 // Handle map tap if needed
//               },
//             ),
//             mapController: _mapController,
//             layers: [
//               TileLayerOptions(
//                 urlTemplate: "https://api.mapbox.com/styles/v1/"
//                     "{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}",
//                 additionalOptions: {
//                   'accessToken': '<YOUR_MAPBOX_ACCESS_TOKEN>',
//                   'id': 'mapbox/streets-v11',
//                 },
//               ),
//               PolygonLayerOptions(
//                 polygons: _buildPolygons(),
//                 polygonCulling: true,
//                 polygonDraggable: true,
//                 polygonDragStart: (polygonId) {
//                   // Handle drag start
//                 },
//                 polygonDragEnd: (polygonId, points) {
//                   // Update the polygon points after drag
//                   int index = _polygonPoints
//                       .indexWhere((point) => point.latitude == points.first.latitude && point.longitude == points.first.longitude);
//                   if (index != -1) {
//                     _updatePolygonPoints(points.first, index);
//                   }
//                 },
//                 polygonDragUpdate: (polygonId, points) {
//                   // Handle drag update
//                 },
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 16,
//             left: 16,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Perform any action on button press
//               },
//               child: Text('Button'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
