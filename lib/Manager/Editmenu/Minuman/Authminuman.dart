import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:kantin/toats/dialogtoast.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:kantin/toats/dialogtoast.dart';

class Authminuman extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatefood = false.obs;

  TextEditingController idC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  String? selectedValue;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;
  final ImagePicker picker = ImagePicker();
  XFile? image;
  // Future<QuerySnapshot<Object?>> getMinuman() async {
  //   CollectionReference minuman = firestore.collection("Minuman");

  //   return minuman.get();
  // }

  //menampilkan dtabse di editmenu
  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference edRef = firestore.collection("Minuman").doc(docID);
    return edRef.get();
  }

  //mengupdate menu
  void editproduct(String id, String nama, String harga, String docID) async {
    DocumentReference docData = firestore.collection("Minuman").doc(docID);
    try {
      if (image != null) {
        // upload avatar image to storage
        File file = File(image!.path);
        await storage.ref(id).putFile(file);
      }
      String avatarUrl = await storage.ref(id).getDownloadURL();
      await docData.update({
        "id": id,
        "nama": nama,
        "harga": harga,
        "typeuser": selectedValue.toString(),
        "profil": avatarUrl,
        "created_at": DateTime.now().toIso8601String(),
      });
      Get.defaultDialog(
        title: "berhasil",
        middleText: "Berhasil mengubah data produk",
        onConfirm: () {
          idC.clear();
          namaC.clear();
          hargaC.clear();
          selectedValue = null;
          image = null;
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil mengubah data produk",
        textConfirm: "okey",
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference minuman = firestore.collection("Minuman");
    return minuman.snapshots();
  }

  void deleteProduct(String docId) {
    DocumentReference docRef = firestore.collection("Minuman").doc(docId);

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

  void pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image!.path);
      print(image!.name.split(".").last);
    }
    update();
  }
}
