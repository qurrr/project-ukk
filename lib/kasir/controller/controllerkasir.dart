import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';
import 'package:kantin/kasir/controller/controller.dart';

class KasirController extends GetxController {
  RxList<PaymentsModel> pesanans = RxList<PaymentsModel>([]);
  Rx<PaymentsModel> payModel = PaymentsModel().obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static KasirController instance = Get.find();
  onReady() {
    super.onReady();
    print(getAllcart());

    pesanans.bindStream(getAllcart());
  }

  Stream<List<PaymentsModel>> getAllcart() => FirebaseFirestore.instance
      .collection("Transaksi")
      .snapshots()
      .map((query) => query.docs
          .map((item) => PaymentsModel.fromMap(item.data()))
          .toList());

  // Stream<DocumentSnapshot<Map<String, dynamic>>>
  //     streampesananpelanggan() async* {
  //   firestore.collection("Transaksi").doc().get();
  // }

  // Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
  //   String uid = auth.currentUser!.uid;
  //   yield* firestore.collection("pengguna").doc(uid).snapshots();
  // }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("pengguna").doc(uid).snapshots();
  }
}
