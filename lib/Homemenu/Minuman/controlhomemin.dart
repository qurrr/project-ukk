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

class controlhomemin extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatefood = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;
  final ImagePicker picker = ImagePicker();
  XFile? image;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference minuman = firestore.collection("Minuman");
    return minuman.snapshots();
  }
}
