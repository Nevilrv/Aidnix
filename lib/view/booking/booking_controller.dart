import 'package:aidnix/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  TabController? tabController;
  int currentStep = 0;

  List<Map<String, dynamic>> bookedTest = [
    {
      "Icon": AppAssets.bloodTestSmallIcon,
      "title": "Blood Test",
    },
    {
      "Icon": AppAssets.urineTest,
      "title": "Urine Test",
    },
    {
      "Icon": AppAssets.heartTest,
      "title": "Heart Test",
    },
    {
      "Icon": AppAssets.heartTest,
      "title": "Heart Test",
    },
  ];

  int selectTabIndex = 0;

  List tabList = [
    "All",
    "Upcoming",
    "Completed",
    "Cancelled",
  ];

  // List<StepperData> stepperData = [
  //   StepperData(
  //       title: StepperText("Order Confirmed", textStyle: textStyleBlackH15W600),
  //       subtitle:
  //           StepperText("on 20 Jan, 2024", textStyle: textStyleGreyH12W400),
  //       iconWidget: Container(
  //         padding: const EdgeInsets.all(8),
  //         decoration: BoxDecoration(
  //             color: kLightGreen1,
  //             borderRadius: const BorderRadius.all(Radius.circular(30))),
  //         child: SvgPicture.asset("assets/icons/tabler_clock.svg"),
  //       )),
  //   StepperData(
  //       title:
  //           StepperText("sample collected", textStyle: textStyleBlackH15W600),
  //       subtitle:
  //           StepperText("on 23 Jan, 2024", textStyle: textStyleGreyH12W400),
  //       iconWidget: Container(
  //         padding: const EdgeInsets.all(8),
  //         decoration: BoxDecoration(
  //             color: kGreen,
  //             borderRadius: const BorderRadius.all(Radius.circular(30))),
  //         child: SvgPicture.asset(
  //           "assets/icons/mingcute_microscope_icon.svg",
  //           color: AppColors.whiteColor,
  //         ),
  //       )),
  //   StepperData(
  //       title: StepperText("Results Ready", textStyle: textStyleBlackH15W600),
  //       subtitle:
  //           StepperText("on 23 Jan, 2024", textStyle: textStyleGreyH12W400),
  //       iconWidget: SvgPicture.asset(
  //         "assets/icons/circle.svg",
  //         fit: BoxFit.cover,
  //       )),
  //   StepperData(
  //       title:
  //           StepperText("Report Delivered", textStyle: textStyleBlackH15W600),
  //       subtitle:
  //           StepperText("on 23 Jan, 2024", textStyle: textStyleGreyH12W400),
  //       iconWidget: Container(
  //         height: 20,
  //         width: 20,
  //         color: Colors.transparent,
  //         child: SvgPicture.asset(
  //           "assets/icons/circle.svg",
  //         ),
  //       )),
  // ];
}
