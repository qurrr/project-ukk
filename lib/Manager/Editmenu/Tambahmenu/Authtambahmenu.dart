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

class EditMenuAuth extends GetxController {
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

  clearTextInput() {
    idC.clear();
    namaC.clear();
    hargaC.clear();
  }

  Future<void> Addfood() async {
    isLoadingCreatefood.value = false;
    try {
      if (image != null) {
        // upload avatar image to storage
        File file = File(image!.path);
        await storage.ref(idC.text).putFile(file);
      }
      image = null;
      // if (image != null) {
      //   // upload avatar image to storage
      //   File file = File(image!.path);
      //   String ext = image!.name.split(".").last;
      //   String upDir = "${idC}/avatar.$ext";
      //   await storage.ref(upDir).putFile(file);
      //   String avatarUrl = await storage.ref(upDir).getDownloadURL();
      // }
      String avatarUrl = await storage.ref(idC.text).getDownloadURL();
      DocumentReference respons =
          firestore.collection(selectedValue.toString()).doc(idC.text);
      respons.set({
        "id": idC.text,
        "nama": namaC.text,
        "harga": hargaC.hashCode,
        "typeuser": selectedValue.toString(),
        "profil": avatarUrl,
        "created_at": DateTime.now().toIso8601String(),
      });

      Get.defaultDialog(
        title: "berhasil",
        middleText: "berhasil menabahkan produk",
        onConfirm: () {
          image = null;
          clearTextInput();
          selectedValue = null;
          Get.back();
        },
        textConfirm: "YA",
      );

      isLoadingCreatefood.value = false;
    } catch (e) {
      isLoadingCreatefood.value = false;
      TostDialog.TostDil("Error : ${e.toString()}");
    }
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
