import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kWhite,
            body: controller.screenList[controller.selected],
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                color: kGreen.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  controller.bottomItems.length,
                  (index) => GestureDetector(
                    onTap: () {
                      controller.selected = index;
                      controller.update();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          controller.bottomItems[index]['icon']!,
                          height: 28,
                          color: controller.selected == index ? kBlack : const Color(0xffA6A6A6),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.bottomItems[index]['title']!,
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: "Poppins",
                            color: controller.selected == index ? kBlack : const Color(0xffA6A6A6),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
