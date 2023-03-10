import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kantin/Homemenu/Coffe/controlhomecoffe.dart';
import 'package:kantin/Homemenu/Coffe/productsingle.dart';
import 'package:kantin/Homemenu/cart/Keranjang1.dart';
import 'package:kantin/Homemenu/cart/cartcontrol.dart';
import 'package:kantin/Homemenu/cart/modelcart.dart';
import 'package:kantin/kasir/controller/controller.dart';
import 'package:kantin/toats/dialogtoast.dart';
import 'package:kantin/Homemenu/Coffe/controller.dart';

import '../constlog.dart';
import '../modelproduct.dart';

class CartController extends GetxController {
  TextEditingController nameC = TextEditingController();
  RxList<CartItemModel> Modelcart = RxList<CartItemModel>([]);
  Rx<CartItemModel> cartmodel = CartItemModel().obs;
  static CartController instance = Get.find();
  final now = new DateTime.now();

  TextEditingController namapelangganC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  onReady() {
    super.onReady();
    print(getAllcart());
    Modelcart.bindStream(getAllcart());
    // ever(cartController.Modelcart, changeCartTotalPricee());
  }

// menambahkan peoduk ke keranjang
  void addProductToCart(ProductModel product) {
    try {
      if (_addprod == null) {
        Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        DocumentReference respons =
            firestore.collection("Cart").doc(product.id);
        respons.set({
          "id": product.id,
          "name": product.name,
          "quantity": 1,
          "price": int.parse(product.harga.toString()),
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
      if (item != null) item.quantity = item.quantity! - 1;
      // item.quantity --;
      FirebaseFirestore.instance.collection("Cart").doc(item.id).update({
        "quantity": item.quantity,
      });
    }
  }

  void increaseQuantity(CartItemModel item) {
    // removeCartItem(item);
    if (item != null) item.quantity = item.quantity! + 1;
    // item.quantity++;
    logger.i({"quantity": item.quantity});
    FirebaseFirestore.instance.collection("Cart").doc(item.id).update({
      "quantity": item.quantity,
    });
  }

  List<CartItemModel> checkOutModelList = [];
  void paymentAdd() {
    try {
      // if (nameC.text.isNotEmpty) {

      DocumentReference respons =
          firestore.collection("Transaksi").doc(namapelangganC.text);
      respons.set({
        "nama": namapelangganC.text,
        "total": subtotal,
        "status": 0,
        "createdAt": DateFormat.yMd().format(now),
        "cart": Modelcart.map((data) => data.toJson()).toList(),
        "kasir": "nama",
        "bulan": DateFormat.M().format(now),
        "tanggal": DateFormat.d().format(now)
      });
      delete();
      namapelangganC.clear();
      Get.back();
      Get.back();
      // }
    } catch (e) {
      Get.snackbar("Error", "gagal melakukan transaksi");
      debugPrint(e.toString());
    }
  }

  Future<void> delete() async {
    var collection = FirebaseFirestore.instance.collection("Cart");
    var snapshot = await collection.get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  // get cartitem => cartController.Modelcart.map(
  //     (element) => element.price! * element.quantity!).toList();

  get subtotal => cartController.Modelcart.map(
          (element) => element.price! * element.quantity!)
      .toList()
      .reduce((value, element) => value + element)
      .toInt();
}
