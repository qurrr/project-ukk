import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';

class KasirController extends GetxController {
  static KasirController instance = Get.find();

  Stream<List<PaymentsModel>> getAllcart() => FirebaseFirestore.instance
      .collection("Cart")
      .snapshots()
      .map((query) => query.docs
          .map((item) => PaymentsModel.fromMap(item.data()))
          .toList());
}
