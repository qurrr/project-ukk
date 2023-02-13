import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kantin/Homemenu/Coffe/controlhomecoffe.dart';
import 'package:kantin/Homemenu/cart/cartcontrol.dart';
import 'package:kantin/Homemenu/cart/modelcart.dart';
import 'package:kantin/toats/dialogtoast.dart';
import 'package:kantin/Homemenu/Coffe/controller.dart';

import '../constlog.dart';
import '../modelproduct.dart';

class CartController extends GetxController {
  // Rx<CartItemModel> Modelcartt = CartItemModel().obs;
  RxList<CartItemModel> Modelcart = RxList<CartItemModel>([]);
  static CartController instance = Get.find();
  RxBool obsecureText = true.obs;
  RxBool isLoading = false.obs;
  Rx<double> totalCartPrice = 0.0.obs;
  List<CartItemModel> checkOutModelList = [];

  TextEditingController nameC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  onReady() {
    super.onReady();
    print(getAllcart());
    Modelcart.bindStream(getAllcart());
    // ever(cartController.Modelcart, changeCartTotalPricee());
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
        DocumentReference respons =
            firestore.collection("Cart").doc(product.id);
        respons.set({
          "id": product.id,
          "name": product.name,
          "quantity": 1,
          "price": product.harga,
          "image": product.foto,
          "category": product.category,
          "cost": product.harga
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
    FirebaseFirestore.instance
        .collection("Cart")
        .where("id", isEqualTo: product.id);
  }

  Stream<List<CartItemModel>> getAllcart() => FirebaseFirestore.instance
      .collection("Cart")
      .snapshots()
      .map((query) => query.docs
          .map((item) => CartItemModel.fromMap(item.data()))
          .toList());

  void removeCartItem(CartItemModel cartItem) {
    try {
      FirebaseFirestore.instance.collection("Cart").doc(cartItem.id).update({
        "quantity": cartItem.quantity,
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
    }
  }

  void decreaseQuantity(CartItemModel item) {
    DocumentReference docRef = firestore.collection("Cart").doc(item.id);

    if (item.quantity == 1) {
      docRef.delete();
    } else {
      removeCartItem(item);
      item.quantity--;
      FirebaseFirestore.instance.collection("Cart").doc(item.id).update({
        "quantity": item.quantity,
      });
    }
  }

  void increaseQuantity(CartItemModel item) {
    // removeCartItem(item);
    item.quantity++;
    logger.i({"quantity": item.quantity});
    FirebaseFirestore.instance.collection("Cart").doc(item.id).update({
      "quantity": item.quantity,
    });
  }

  List<CartItemModel> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  // changeCartTotalPrice(CartItemModel item) {
  //   totalCartPrice = 0;
  //   if (cartController.Modelcart.isEmpty) {
  //     cartController.Modelcart.forEach((Element) {
  //       totalCartPrice + item.price;
  //     });
  //   }
  // }
  changeCartTotalPrice(CartItemModel item) {
    totalCartPrice.value = 0.0;
    if (cartController.Modelcart.isEmpty) {
      cartController.Modelcart.forEach((cartItem) {
        totalCartPrice += cartItem.cost;
      });
    }
  }
  // totalcart(CartItemModel item) {
  //   cartController.getCheckOutModelList.forEach((item) {
  //     totalCartPrice += item.price * item.quantity;
  //   });
  // }
}
