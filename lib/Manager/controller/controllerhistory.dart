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
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';
import 'package:kantin/Manager/model/datenow.dart';
import 'package:kantin/kasir/controller/controller.dart';
import 'package:kantin/toats/dialogtoast.dart';
import 'package:kantin/Homemenu/Coffe/controller.dart';

class ManagerController extends GetxController {
  static ManagerController instance = Get.find();
  final now = new DateTime.now();
  Rx<tanggalnow> tgl = tanggalnow().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // onReady() {
  //   super.onReady();
  //   // print(getAlltransaksi());
  //   // kasirController.pesanans.bindStream(getAlltransaksi());
  //   // print(subtotal);
  //   // ever(cartController.Modelcart, changeCartTotalPricee());
  // }

  // Stream<List<PaymentsModel>> getAlltransaksi() => FirebaseFirestore.instance
  //     .collection("Transaksi")
  //     .snapshots()
  //     .map((query) => query.docs
  //         .map((item) => PaymentsModel.fromMap(item.data()))
  //         .toList());

  // void pendapatanharian(String bulan) {
  //   firestore.collection("Transaksi").where("bulan", isEqualTo: bulan).get();
  // }

  // get cartitem =>
  //     kasirController.pesanans.map((element) => element.total).toList();

  // get total => cartController.Modelcart.map(
  //         (element) => element.price! * element.quantity!)
  //     .toList()
  //     .reduce((value, element) => value + element)
  //     .toInt();
  Future<QuerySnapshot<Map<String, dynamic>>> getAllPresence() async {
    if (tgl.value.tglawal == "1 - 1") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "1")
          .orderBy("createdAt")
          .get();
      return query;
    } else if (tgl.value.tglawal == "1 - 2") {}
  }
}