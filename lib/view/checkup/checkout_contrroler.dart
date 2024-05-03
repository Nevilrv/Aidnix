import 'package:aidnix/constant/app_assets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CheckupController extends GetxController {
  ///------------Payment Page Screen-----------------------

  int selectPayment = 0;
  void paymentMethodValue(value) {
    selectPayment = value!;
    update();
  }

  ///--------------Lab Checkout Screen----------------------

  bool selectOtherName = false;
  int selectedOther = 0;

  void patientsValue() {
    selectOtherName = !selectOtherName;
    update();
  }

  void patientsNameValue(value) {
    selectedOther = value!;
    update();
  }

  List<Map<String, dynamic>> selectPatients = [
    {"name": "Kapil Darsan", "value": 1},
    {"name": "Kanak Sharma", "value": 2},
    {"name": "Kapil Darsan", "value": 3},
    {"name": "Kanak Sharma", "value": 4}
  ];

  ///------------CheckOut Details Lab Screen---------------------

  List<Map<String, dynamic>> orderedTestsData = [
    {"image": AppAssets.bloodTesting, "name": "Blood Test"},
    {"image": AppAssets.urineTesting, "name": "Urine Test"},
    {"image": AppAssets.heartTesting, "name": "Heart Test"},
  ];

  ///-------------- Booking Slot Screen------------------------

  int? morningTime;
  int? afternoonTime;
  int? eveningTime;
  int selectDey = 0;
  int selectReason = 0;

  void selectDeyValue(index) {
    selectDey = index;
    update();
  }

  void selectMorningValue(index) {
    morningTime = index;
    update();
  }

  void selectAfternoonValue(index) {
    afternoonTime = index;
    update();
  }

  void selectEveningValue(index) {
    eveningTime = index;
    update();
  }

  List<Map<String, dynamic>> timeShortData = [
    {'date': '09', 'dey': "Today"},
    {'date': '10', 'dey': "Tomorrow"},
    {'date': '11', 'dey': "Sunday"},
    {'date': '12', 'dey': "Monday"},
  ];
  List<Map<String, dynamic>> confirmSlotList = [
    {"name": "Missed the fasting requirements", "value": 1},
    {"name": "My preferred collection slot is not available ", "value": 2},
    {"name": "Need to change sample collation address  ", "value": 3},
    {"name": "Order placed by mistake", "value": 4},
    {"name": "Need to add/remove tests", "value": 5},
    {"name": "Payment issue", "value": 6},
    {"name": "Founder better price elsewhere", "value": 7},
    {"name": "Need to apply coupon offer", "value": 8},
    {"name": "Reason not listed here", "value": 9},
  ];

  List morningList = [
    "6:45 AM",
    "7:45 AM",
    "9:30 AM",
    "10:15 AM",
    "11:15 AM",
    "12:00 AM"
  ];

  List afternoonList = [
    "12:35 PM",
    "1:15 PM",
    "2:15 PM",
    "03:00 PM",
    "4:15 PM",
    "5:00 PM",
    "12:35 PM",
    "1:15 PM",
    "2:15 PM"
  ];

  List eveningList = ["12:35 PM", "1:15 PM", "2:15 PM", "03:00 PM"];
}
