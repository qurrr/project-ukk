import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kantin/toats/dialogtoast.dart';

import '../modelproduct.dart';

class CartController extends GetxController {
  RxBool obsecureText = true.obs;
  RxBool isLoading = false.obs;

  TextEditingController nameC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  void addProductToCart(ProductModel product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        // String itemId = Uuid().toString();
        // userController.updateUserData({
        //   "cart": FieldValue.arrayUnion([
        //     {
        //       "id": itemId,
        //       "productId": product.id,
        //       "name": product.name,
        //       "quantity": 1,
        //       "price": product.price,
        //       "image": product.image,
        //       "cost": product.price
        //     }
        //   ])
        // });
        DocumentReference respons = firestore.collection("Cart").doc();
        respons.set({
          "id": product.id,
          "name": product.name,
          "quantity": 1,
          "price": product.harga,
          "image": product.foto,
          "category": product.category
        });
        Get.snackbar("Item added", "${product.name} was added to your cart");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
  }
}
