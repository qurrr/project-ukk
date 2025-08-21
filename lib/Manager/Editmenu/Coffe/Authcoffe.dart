import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'package:image_picker/image_picker.dart';

class Authcoffe extends GetxController {
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

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference coffe = firestore.collection("Coffe");
    return coffe.snapshots();
  }

  //menampilkan db ke txtfield
  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference edRef = firestore.collection("Coffe").doc(docID);
    return edRef.get();
  }

  void editproduct(String id, String nama, String harga, String docID) async {
    DocumentReference docData = firestore.collection("Coffe").doc(docID);
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

  void deleteProduct(String docId) {
    DocumentReference docRef = firestore.collection("Coffe").doc(docId);

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
