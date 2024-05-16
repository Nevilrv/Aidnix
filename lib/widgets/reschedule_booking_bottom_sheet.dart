import 'package:aidnix/theme/app_theme.dart';
import 'package:aidnix/view/booking/booking_controller.dart';
import 'package:aidnix/widgets/app_button.dart';
import 'package:aidnix/widgets/app_textfield.dart';
import 'package:aidnix/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RescheduleBookingBottomSheet extends StatelessWidget {
  const RescheduleBookingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: GetBuilder<BookingController>(
          init: BookingController(),
          builder: (controller) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              constraints: BoxConstraints(maxHeight: 550.h),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 5.w),
                        customText(text: "Reschedule Booking", fontSize: 22.sp, fontWeight: FontWeight.w600),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close_rounded,
                            color: kGrey,
                            size: 30.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    regularText(text: "Reschedule Date", color: kDarkGrey1),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: controller.rescheduleDateController,
                      hintText: "DD/MM/YYYY",
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                      readOnly: true,
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null) {
                          controller.rescheduleDateController.text = DateFormat('dd-MM-yyyy').format(picked);

                          controller.update();
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    regularText(text: "Reschedule Time", color: kDarkGrey1),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: controller.rescheduleTimeController,
                      hintText: "Ex. 00:00 PM",
                      suffixIcon: Icon(Icons.watch_later_outlined),
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.inputOnly,
                        );
                        if (picked != null) {
                          if (context.mounted) {
                            print("Reschedule Picked Time 11 ::::::::::::::: ${picked.format(context)}");

                            controller.rescheduleTimeController.text = picked.format(context);

                            controller.update();
                          }
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          buttonText: "Reset",
                          textStyle: TextStyle(color: kGreen, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                          border: Border.all(color: kGreen),
                          buttonColor: kWhite,
                          onTap: () {
                            controller.rescheduleDateController.clear();
                            controller.rescheduleTimeController.clear();
                            controller.update();
                          },
                        ),
                        CustomButton(
                          buttonText: "Apply",
                          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                          onTap: () {
                            controller.rescheduleBooking();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
