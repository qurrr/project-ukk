import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';


class ManagerController extends GetxController {
  static ManagerController instance = Get.find();
  final now = new DateTime.now();
  // Rx<bulannow> tgl = tanggalnow().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  onReady() {
    super.onReady();
    print(getAllhistory);

    // Modelcart.bindStream(getAllcart());
    // ever(cartController.Modelcart, changeCartTotalPricee());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getalltotal(String bulan) async {
    QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: bulan)
          .where("status", isEqualTo: 1)
          .get();

      return query;
  }



  Future<QuerySnapshot<Map<String, dynamic>>> getAllhistory(
      String bulan) async {
    if (bulan == "1 - 1") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "1")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();

      return query;
    } else if (bulan == "1 - 2") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "2")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else if (bulan == "1 - 3") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "3")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else if (bulan == "1 - 4") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "4")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else if (bulan == "1 - 5") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "5")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else if (bulan == "1 - 6") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "6")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else if (bulan == "1 - 7") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "7")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else if (bulan == "1 - 8") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "8")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else if (bulan == "1 - 9") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "9")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else if (bulan == "1 - 10") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "10")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else if (bulan == "1 - 11") {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "11")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    } else {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("Transaksi")
          .where("bulan", isEqualTo: "12")
          .where("status", isEqualTo: 1)
          .orderBy("createdAt")
          .get();
      return query;
    }
  }
}
