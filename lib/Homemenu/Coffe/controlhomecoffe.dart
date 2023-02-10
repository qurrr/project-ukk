
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../modelproduct.dart';

class Productcontrollercoffe extends GetxController {
  static Productcontrollercoffe instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "Coffe";

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  onReady() {
    super.onReady();
    print(getAllProducts());
    products.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() => FirebaseFirestore.instance
      .collection(collection)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
}
