import "package:kantin/admin/Admin.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kantin/toats/dialogtoast.dart';

class tambahusercontroller extends GetxController {
  RxBool obsecureText = true.obs;
  RxBool isLoading = false.obs;
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController jenkelC = TextEditingController();
  String? selectedValue;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  //membuat akun pengguna
  Future<void> tambahuser(BuildContext context) async {
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
            "nama": namaC.text,
            "email": emailC.text,
            "password": passC.text,
            "jeniskelamin": jenkelC.text,
            "typeuser": selectedValue.toString(),
            "created_at": DateTime.now().toIso8601String(),
          });
          auth.signOut();

          await auth.signInWithEmailAndPassword(
              email: emailC.text, password: passC.text);
          Get.defaultDialog(
            title: "Berhasil",
            middleText: "Berhasil Menambahkan akun",
            textConfirm: "OKE",
            onConfirm: () {
              namaC.clear();
              emailC.clear();
              passC.clear();
              jenkelC.clear();
              selectedValue = null;
              Get.back();
              Get.back();
            },
          );
          isLoading.value = false;
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

  //menampilkan akun di halaman admin
  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference coffe = firestore.collection("pengguna");
    return coffe.snapshots();
  }

  void deleteuser(String docId) {
    DocumentReference docRef = firestore.collection("pengguna").doc(docId);

    Get.defaultDialog(
      title: "Delete data",
      middleText: "Apakah anda yakin menghapus data ini ?",
      onConfirm: () async {
        await docRef.delete();
        Get.back();
      },
      textConfirm: "YES",
      textCancel: "NO",
    );
  }
}
