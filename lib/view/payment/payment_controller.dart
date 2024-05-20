import 'package:get/get.dart';

class PaymentController extends GetxController {
  int selectPayment = 0;
  void paymentMethodValue(int value) {
    selectPayment = value;
    update();
  }
}
