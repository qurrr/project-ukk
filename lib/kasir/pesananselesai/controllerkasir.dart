import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';
import 'package:kantin/kasir/controller/controller.dart';

class HistoryKasir extends GetxController {
  RxList<PaymentsModel> pesananselesai = RxList<PaymentsModel>([]);
  Rx<PaymentsModel> payModel = PaymentsModel().obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static HistoryKasir instance = Get.find();
  onReady() {
    super.onReady();
    print(getAllcart());

    pesananselesai.bindStream(getAllcart());
    ;
  }

  Stream<List<PaymentsModel>> getAllcart() => FirebaseFirestore.instance
      .collection("Transaksi")
      .where("status", isEqualTo: 1)
      .snapshots()
      .map((query) => query.docs
          .map((item) => PaymentsModel.fromMap(item.data()))
          .toList());

  void updatedata(PaymentsModel itempemesanan, idkasir) {
    FirebaseFirestore.instance
        .collection("Transaksi")
        .doc(itempemesanan.nama)
        .update({
      "status": 1,
      "kasir": idkasir,
    });
  }

  // Stream<PaymentsModel> getAllcart() => firestore
  //     .collection("Transaksi")
  //     .docs
  //     .snapshots()
  //     .map((snapshot) => PaymentsModel.fromSnapshot(snapshot));

// const snapshot = await firebase.firestore().collection('events').get()
//     return snapshot.docs.map(doc => doc.data());

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
