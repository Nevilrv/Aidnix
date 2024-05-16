import 'package:aidnix/models/common_response.dart';
import 'package:aidnix/models/res_add_cart_details_api.dart';
import 'package:aidnix/models/res_delete_cart_data_api.dart';
import 'package:aidnix/models/res_get_cart_details_api.dart';
import 'package:aidnix/models/res_get_cart_summary_api.dart';
import 'package:aidnix/repository/cart_repository.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  /// Get Cart Data Api******************
  bool isLoading = false;
  CartData? cartData;

  getCartData({required String cartId}) async {
    isLoading = true;
    update();

    // var response = await CartRepository().getCartDetailsAPI(cartId: cartId);
    var response = await CartRepository().getCartDetailsAPI(cartId: "1462854d-1e45-4384-9b08-1f83dad4ef80");
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

  addCartDataApi({required Map<String, dynamic> body}) async {
    isAddCartLoading = true;
    update();

    // var response = await CartRepository().addCartDetailsAPI(body: body);
    var response = await CartRepository().addCartDetailsAPI(
      body: {
        "lab_id": "33451d03-39bd-48fb-ba19-133ff062fc00",
        "lab_item_id": "a6fd5a7c-d3e4-445c-8ce9-3ffe4cc4e176",
      },
    );
    update();
    print('Response Add Cart Details API Data :::::::::::::::::: $response');

    if (response != null) {
      addCartData = response.data;
      update();
    }
    isAddCartLoading = false;
    update();
  }

  /// Get Cart Summary Data API *****************
  bool isGetCartSummaryLoading = false;
  CartSummaryData? cartSummaryData;

  getCartSummaryDataApi({required String cartId}) async {
    isGetCartSummaryLoading = true;
    update();

    // var response = await CartRepository().getCartSummaryDetailsAPI(cartId: cartId);
    var response = await CartRepository().getCartSummaryDetailsAPI(cartId: "1462854d-1e45-4384-9b08-1f83dad4ef80");
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
  CommonResponse? deleteCartItemData;

  deleteCartItemDataApi({required String cartId, required String labId}) async {
    isDeleteCartItemLoading = true;
    update();

    // var response = await CartRepository().deleteCartItemAPI(cartId: cartId, labId: labId);
    var response = await CartRepository()
        .deleteCartItemAPI(cartId: "93e71bbf-9316-4c04-9a43-a375fe9de766", labId: "22b2d325-f750-4248-84ca-594a3088ef1c");

    update();
    print('Response Delete Cart Items API Data :::::::::::::::::: $response');

    if (response != null) {
      deleteCartItemData = response.data as CommonResponse?;
      update();
    }
    isDeleteCartItemLoading = false;
    update();
  }

  /// Delete Cart  API *****************
  bool isDeleteCartLoading = false;
  DeleteCartData? deleteCartData;

  deleteCartDataApi({required String cartId}) async {
    isDeleteCartLoading = true;
    update();

    // var response = await CartRepository().deleteCartAPI(cartId: cartId);
    var response = await CartRepository().deleteCartAPI(cartId: "93e71bbf-9316-4c04-9a43-a375fe9de766");

    update();
    print('Response Delete Cart API Data :::::::::::::::::: $response');

    if (response != null) {
      deleteCartData = response.data;
      update();
    }
    isDeleteCartLoading = false;
    update();
  }
}