import 'dart:developer';
import 'package:aidnix/constant/app_assets.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/address/address_controller.dart';
import 'package:aidnix/widgets/app_app_bar.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  AddressController addressController = Get.put(AddressController());
  GoogleMapController? googleMapController;

  Marker initialMarker = const Marker(
    markerId: MarkerId('1'),
  );

  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.4746,
  );

  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: LatLng(addressController.latitude, addressController.longitude),
      zoom: 14.4746,
    );

    initialMarker = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(addressController.latitude, addressController.longitude),
      infoWindow: const InfoWindow(title: 'My Position'),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      List<Placemark> address = await placemarkFromCoordinates(addressController.latitude, addressController.longitude);

      addressController.areaController.text = "${address.first.thoroughfare ?? ""},${address.first.subLocality ?? ""}";
      addressController.houseNoController.text = address.first.street ?? "";
      addressController.cityController.text = address.first.locality ?? "";
      addressController.stateController.text = address.first.administrativeArea ?? "";
      addressController.pinCodeController.text = address.first.postalCode ?? "";
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(titleText: "Addresses"),
      body: GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) {
          /// Original View

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300.h,
                child: GoogleMap(
                  onTap: (LatLng? latLong) async {
                    log("LAt Long On Tap ::::::::::::::::::: latitude : ${latLong?.latitude} ::::::: longitude :${latLong?.longitude}");

                    setState(() {
                      initialCameraPosition = CameraPosition(
                        target: LatLng(latLong?.latitude ?? controller.latitude, latLong?.longitude ?? controller.longitude),
                        zoom: 14.4746,
                      );

                      initialMarker = Marker(
                        markerId: const MarkerId('1'),
                        position: LatLng(latLong?.latitude ?? controller.latitude, latLong?.longitude ?? controller.longitude),
                        infoWindow: const InfoWindow(title: 'My Position'),
                      );

                      googleMapController?.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: LatLng(latLong?.latitude ?? controller.latitude, latLong?.longitude ?? controller.longitude),
                            zoom: 18,
                          ),
                        ),
                      );
                    });

                    List<Placemark> address = await placemarkFromCoordinates(
                        latLong?.latitude ?? controller.latitude, latLong?.longitude ?? controller.longitude);

                    log("On TAp Address :::::::::: ${address.first.toJson()}");

                    addressController.areaController.text = "${address.first.thoroughfare ?? ""},${address.first.subLocality ?? ""}";
                    addressController.houseNoController.text = address.first.street ?? "";
                    addressController.cityController.text = address.first.locality ?? "";
                    addressController.stateController.text = address.first.administrativeArea ?? "";
                    addressController.pinCodeController.text = address.first.postalCode ?? "";

                    controller.update();
                  },
                  mapType: MapType.normal,
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
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                  child: SingleChildScrollView(
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
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        SizedBox(height: 20.h),
                        regularText(text: "Label as"),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            CustomButton(
                              buttonText: "",
                              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                              buttonColor: controller.addressType == "Home" ? kGreen : kDropDownBgColor,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    AppAssets.homeIcon,
                                    scale: 4,
                                    color: controller.addressType == "Home" ? kWhite : kGreen,
                                  ),
                                  SizedBox(width: 10.w),
                                  customText(
                                    text: "Home",
                                    fontSize: 12.sp,
                                    color: controller.addressType == "Home" ? kWhite : const Color(0xFF5A5A5A),
                                  ),
                                ],
                              ),
                              onTap: () {
                                controller.addressType = "Home";
                                controller.update();
                              },
                            ),
                            SizedBox(width: 20.w),
                            CustomButton(
                              buttonText: "",
                              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                              buttonColor: controller.addressType == "Other" ? kGreen : kDropDownBgColor,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    AppAssets.locationOutline,
                                    scale: 4,
                                    color: controller.addressType == "Other" ? kWhite : kGreen,
                                  ),
                                  SizedBox(width: 10.w),
                                  customText(
                                    text: "Other",
                                    fontSize: 12.sp,
                                    color: controller.addressType == "Other" ? kWhite : const Color(0xFF5A5A5A),
                                  ),
                                ],
                              ),
                              onTap: () {
                                controller.addressType = "Other";
                                controller.update();
                              },
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
                          onTap: () {
                            controller.addAddress();
                          },
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
