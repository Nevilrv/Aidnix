import 'package:aidnix/constant/app_assets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CheckoutController extends GetxController {
  ///------------CheckOut Details Lab Screen---------------------

  List<Map<String, dynamic>> orderedTestsData = [
    {"image": AppAssets.bloodTesting, "name": "Blood Test"},
    {"image": AppAssets.urineTesting, "name": "Urine Test"},
    {"image": AppAssets.heartTesting, "name": "Heart Test"},
  ];
}
