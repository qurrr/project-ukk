import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kantin/Homemenu/Coffe/controlhomecoffe.dart';
import 'package:kantin/Homemenu/cart/modelcart.dart';
import 'package:kantin/toats/dialogtoast.dart';
import 'package:kantin/Homemenu/Coffe/controller.dart';

import '../modelproduct.dart';

class CartController extends GetxController {
  // Rx<CartItemModel> Modelcartt = CartItemModel().obs;
  RxList<CartItemModel> Modelcart = RxList<CartItemModel>([]);
  static CartController instance = Get.find();
  RxBool obsecureText = true.obs;
  RxBool isLoading = false.obs;
  

  TextEditingController nameC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

    onReady() {
    super.onReady();
    print(getAllcart());
    Modelcart.bindStream(getAllcart());
  }

  void addProductToCart(ProductModel product) {
    try {
        //               DocumentReference respons = firestore.collection("Cart").doc(product.id);
        // respons.set({
        //   "id": product.id,
        //   "name": product.name,
        //   "quantity": 1,
        //   "price": product.harga,
        //   "image": product.foto,
        //   "category": product.category
        // });
        // Get.snackbar("Item added", "${product.name} was added to your cart");
      if (_addprod == null) {
                Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        
        DocumentReference respons = firestore.collection("Cart").doc(product.id);
        respons.set({
          "id": product.id,
          "name": product.name,
          "quantity": 1,
          "price": product.harga,
          "image": product.foto,
          "category": product.category
        });
        Get.snackbar("Item added", "${product.name} Sudah ditambahkan");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
  }
  //   FirebaseFirestore.instance.collection('decision')
  // .where("team_member_emails", "array-contains", "snjmediastudio@gmail.com")
      // userController.userModel.value.cart
      //     .where((item) => item.productId == product.id)
      //     .isNotEmpty;

     _addprod(ProductModel product) {
       FirebaseFirestore.instance.collection("Cart")
        .where("id", isEqualTo: product.id);
      }
        Stream<List<CartItemModel>> getAllcart() => FirebaseFirestore.instance
      .collection("Cart")
      .snapshots()
      .map((query) =>
          query.docs.map((item) => CartItemModel.fromMap(item.data())).toList());
}
