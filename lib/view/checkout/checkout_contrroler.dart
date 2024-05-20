import 'package:aidnix/constant/app_assets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CheckoutController extends GetxController {
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
}
