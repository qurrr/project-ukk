// import 'dart:convert';
// import 'dart:ffi';

// import 'package:http/http.dart' as http;
// import '../models/player.dart';
// import 'package:firebase_database/firebase_database.dart';

// class Pengguna with ChangeNotifier {
//   List<users> _alluser = [];

//   List<users> get alluser => _alluser;

//   int get jumlahuser => _alluser.length;

//   users selectById(String id) =>
//       _alluser.firstWhere((element) => element.id == id);

//   Future<void> addUser(String name, String email, String password,
//       String jeniskelamin, String typeuser, BuildContext context) {
//     DateTime dateTimeNow = DateTime.now();

//     Uri url = Uri.parse(
//         "https://kasir-firebase-7a0ed-default-rtdb.firebaseio.com/pengguna.json");

//     return http
//         .post(
//       url,
//       body: json.encode(
//         {
//           "nama": name,
//           "email": email,
//           "password": password,
//           "jeniskelamin": jeniskelamin,
//           "typeuser": typeuser,
//           "createdAt": dateTimeNow.toString(),
//         },
//       ),
//     )
//         .then((respon) {
//       _alluser.add(
//         users(
//           id: json.decode(respon.body)["name"].toString(),
//           name: name,
//           email: email,
//           password: password,
//           jeniskelamin: jeniskelamin,
//           typeuser: typeuser,
//           createdAt: dateTimeNow,
//         ),
//       );
// ScaffoldMessenger.of(context).showSnackBar(
//   SnackBar(
//     content: Text("Berhasil ditambahkan"),
//     duration: Duration(seconds: 2),
//   ),
// );
//       notifyListeners();
//     });
//   }

//   Future<void> authLogin(
//       String email, String password, BuildContext context) async {
//     Uri url = Uri.parse(
//         "https://kasir-firebase-7a0ed-default-rtdb.firebaseio.com/pengguna.json");

//     return http.get(url);
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kantin/toats/dialogtoast.dart';

class RegistController extends GetxController {
  RxBool obsecureText = true.obs;
  RxBool isLoading = false.obs;

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController jenkelC = TextEditingController();
  String? selectedValue;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> regist(BuildContext context) async {
    if (passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        UserCredential credentialrespon =
            await auth.createUserWithEmailAndPassword(
          email: emailC.text.trim(), //fungsi trim untuk menghilangkan spasi
          password: passC.text,
        );
        if (credentialrespon.user != null) {
          String iduser = credentialrespon.user!.uid;
          DocumentReference respons =
              firestore.collection("pengguna").doc(iduser);
          respons.set({
            "id_user": iduser,
            "nama": nameC.text,
            "email": emailC.text,
            "password": passC.text,
            "jeniskelamin": jenkelC.text,
            "typeuser": selectedValue.toString(),
            "created_at": DateTime.now().toIso8601String(),
          });
          auth.signOut();

          await auth.signInWithEmailAndPassword(
              email: emailC.text, password: passC.text);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Berhasil membuat akun"),
              duration: Duration(seconds: 2),
            ),
          );
          isLoading.value = false;
          Get.back();
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code == "sandi lemah") {
          //pesan jika password kurang dari 6
          TostDialog.TostDil("Sandi terlalu pendek");
        } else {
          TostDialog.TostDil('error : ${e.code}');
        }
      }
    } else {
      TostDialog.TostDil("Kata sandi tidak boleh kosong");
    }
  }
}
