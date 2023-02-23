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
    // print(total2b);
    // pesanans.bindStream(total2b);
    pesanans.bindStream(getAllcart());
    ;
  }

  Stream<List<PaymentsModel>> getAllcart() => FirebaseFirestore.instance
      .collection("Transaksi")
      .where("status", isEqualTo: 0)
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
    Get.back();
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

  //total pendapatan harian bulan 2
  // get total2b => kasirController.pesanans
  //     .where((data) => data.bulan == 2)
  //     .map((element) => element.total)
  //     .toList()
  //     .reduce((value, element) => value! + element!)!
  //     .toInt();
  // get total2h => kasirController.pesanans
  //     .where((data) => data.bulan == 2)
  //     .where((element) => element.tanggal! < 0)
  //     .where((element) => element.tanggal! > 30)
  //     .map((element) => element.total)
  //     .toList()
  //     .reduce((value, element) => value! + element!)!
  //     .toInt();
}
