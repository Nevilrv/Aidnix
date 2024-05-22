import 'package:aidnix/models/res_add_cart_details_api.dart';
import 'package:aidnix/models/res_delete_cart_data_api.dart';
import 'package:aidnix/models/res_delete_cart_item_api.dart';
import 'package:aidnix/models/res_get_cart_details_api.dart';
import 'package:aidnix/models/res_get_cart_summary_api.dart';
import 'package:aidnix/repository/cart_repository.dart';
import 'package:aidnix/view/home/home_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  ///------------Lab Cart Page Screen---------------------

  List checkupCardList = ["Blood Test", "Full body checkup", "Urine Test"];

  HomeController homeController = Get.put(HomeController());

  /// Get Cart Data Api******************
  bool isLoading = false;
  CartData? cartData;
  String cartId = "e1eafcbd-ca54-4cce-818b-0a3e808428f9";

  getCartData() async {
    isLoading = true;
    update();

    var response = await CartRepository().getCartDetailsAPI(cartId: cartId);
    update();
    print('Response Get Cart Details API Data :::::::::::::::::: $response');

    if (response != null) {
      cartData = response.data;
      update();
    }
    isLoading = false;
    update();
  }

  /// Add Cart Data API *****************
  bool isAddCartLoading = false;
  AddCartData? addCartData;

  addToCartAPI({required String labId, required String labItemId}) async {
    isAddCartLoading = true;
    update();

    var body = {
      "lab_id": labId,
      "lab_item_id": labItemId,
    };

    // body: {
    //   "lab_id": "33451d03-39bd-48fb-ba19-133ff062fc00",
    //   "lab_item_id": "a6fd5a7c-d3e4-445c-8ce9-3ffe4cc4e176",
    // },

    var response = await CartRepository().addCartDetailsAPI(reqBody: body);
    update();
    print('Response Add Cart Details API Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        addCartData = response.data;
        update();

        if (addCartData != null) {
          cartId = addCartData?.id ?? "";
          update();
          await getCartData();
        }

        // await homeController.homeAPI();

        update();
      }
    }
    isAddCartLoading = false;
    update();
  }

  /// Get Cart Summary Data API *****************
  bool isGetCartSummaryLoading = false;
  CartSummaryData? cartSummaryData;

  getCartSummaryDataApi() async {
    isGetCartSummaryLoading = true;
    update();

    var response = await CartRepository().getCartSummaryDetailsAPI(cartId: cartId);
    update();
    print('Response Get Cart Summary Details API Data :::::::::::::::::: $response');

    if (response != null) {
      cartSummaryData = response.data;
      update();
    }
    isGetCartSummaryLoading = false;
    update();
  }

  /// Delete Cart Items API *****************
  bool isDeleteCartItemLoading = false;
  DeleteCartItemData? deleteCartItemData;

  Future<void> deleteCartItemDataApi({required String labItemId}) async {
    isDeleteCartItemLoading = true;
    update();

    var response = await CartRepository().deleteCartItemAPI(
      cartId: cartData?.referenceId ?? '',
      labItemId: labItemId,
      // labItemId: cartData?.labItems?.first.referenceId ?? '',
    );
    // var response = await CartRepository().deleteCartItemAPI(
    //   cartId: "93e71bbf-9316-4c04-9a43-a375fe9de766",
    //   labId: "22b2d325-f750-4248-84ca-594a3088ef1c",
    // );

    update();
    print('Response Delete Cart Items API Data :::::::::::::::::: $response');

    if (response != null) {
      if (response.data != null) {
        deleteCartItemData = response.data;
        update();
        Get.back();
      }
    }
    isDeleteCartItemLoading = false;
    update();
  }

  /// Delete Cart  API *****************
  bool isDeleteCartLoading = false;
  DeleteCartData? deleteCartData;

  deleteCartDataApi() async {
    isDeleteCartLoading = true;
    update();

    var response = await CartRepository().deleteCartAPI(cartId: cartId);

    update();
    print('Response Delete Cart API Data :::::::::::::::::: $response');

    if (response != null) {
      deleteCartData = response.data;
      update();
      Get.back();
    }
    isDeleteCartLoading = false;
    update();
  }
}
