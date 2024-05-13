import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};

  // final Completer<GoogleMapController> googleMapController = Completer<GoogleMapController>();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Set<Polyline> polylines = {
    const Polyline(
      polylineId: PolylineId('route1'),
      points: [
        LatLng(37.42796133580664, -122.085749655962),
        LatLng(37.42796133580680, -122.085749655980),
        LatLng(37.42796133580690, -122.085749655990),
      ],
      color: Colors.blue,
      width: 4,
    ),
  };

  Set<Polygon> polygons = {
    Polygon(
      polygonId: const PolygonId('area1'),
      points: [
        const LatLng(37.42796133580610, -122.085749655910),
        const LatLng(37.42796133580620, -122.085749655920),
        const LatLng(37.42796133580630, -122.085749655930),
        // LatLng(37.7749, -122.4194),
        // LatLng(37.8051, -122.4300),
        // LatLng(37.8070, -122.4093),
      ],
      fillColor: Colors.green.withOpacity(0.3),
      strokeColor: Colors.green,
      strokeWidth: 2,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Addresses"),
      body: GetBuilder<AddressController>(
          init: AddressController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300.h,
                    // color: Colors.blue,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: kGooglePlex,
                      padding: EdgeInsets.zero,
                      markers: {
                        const Marker(
                          markerId: MarkerId('marker1'),
                          position: LatLng(37.42796133580664, -122.085749655962),
                          infoWindow: InfoWindow(title: 'San Francisco 1'),
                        ),
                        const Marker(
                          markerId: MarkerId('marker2'),
                          position: LatLng(37.42796133580700, -122.085749656000),
                          infoWindow: InfoWindow(title: 'San Francisco 2'),
                        ),
                      },
                      onMapCreated: (GoogleMapController controllers) {
                        googleMapController = controllers;
                        setState(() {
                          markers.add(
                            const Marker(
                              markerId: MarkerId('marker1'),
                              position: LatLng(37.42796133580664, -122.085749655962),
                              infoWindow: InfoWindow(title: 'San Francisco'),
                            ),
                          );
                        });
                        // googleMapController.complete(controllers);
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        regularText(text: "Your location (Apartment / Road / Area)"),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          controller: controller.areaController,
                          hintText: "Ex. Ambika Nagar,Varachha Road",
                        ),
                        SizedBox(height: 20.h),
                        regularText(text: "House no. / Floor no."),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          controller: controller.houseNoController,
                          hintText: "EX. House no. 10, 2nd floor",
                        ),
                        SizedBox(height: 20.h),
                        regularText(text: "City"),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          controller: controller.cityController,
                          hintText: "EX. Surat",
                        ),
                        SizedBox(height: 20.h),
                        regularText(text: "State"),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          controller: controller.stateController,
                          hintText: "EX. Gujarat",
                        ),
                        SizedBox(height: 20.h),
                        regularText(text: "Pincode"),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          controller: controller.pinCodeController,
                          hintText: "EX. 590006",
                        ),
                        SizedBox(height: 20.h),
                        regularText(text: "Label as"),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            CustomButton(
                              buttonText: "",
                              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                              buttonColor: kDropDownBgColor,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(AppAssets.homeIcon, scale: 4),
                                  SizedBox(width: 10.w),
                                  customText(
                                    text: "Home",
                                    fontSize: 12.sp,
                                    color: const Color(0xFF5A5A5A),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                            SizedBox(width: 20.w),
                            CustomButton(
                              buttonText: "",
                              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                              buttonColor: kDropDownBgColor,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(AppAssets.locationOutline, scale: 4),
                                  SizedBox(width: 10.w),
                                  customText(
                                    text: "Other",
                                    fontSize: 12.sp,
                                    color: const Color(0xFF5A5A5A),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        CustomButton(
                          buttonText: "",
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Center(
                            child: headingSemiBoldText(text: "Save"),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
