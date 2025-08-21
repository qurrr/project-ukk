import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:kantin/Routing/Routes.dart';
import 'package:kantin/toats/dialogtoast.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> Loginauth() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        //login dengan email dan passsword
        final credential = await auth.signInWithEmailAndPassword(
            email: emailC.text, password: passC.text);
        if (credential.user != null) {
          String uid = auth.currentUser!.uid;
          await firestore
              .collection("pengguna")
              .doc(uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              if (documentSnapshot.get('typeuser') == "admin") {
                Get.toNamed(Routes.ADMIN);
              } else if (documentSnapshot.get('typeuser') == "kasir") {
                Get.toNamed(Routes.KASIR);
              } else {
                Get.toNamed(Routes.MANAGER);
              }
              emailC.clear();
              passC.clear();
            } else {
              print('Document does not exist on the database');
            }
          });
          isLoading.value = false;
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;

        if (e.code == 'user-not-found') {
          TostDialog.TostDil("Pengguna tidak ditemukan");
        } else if (e.code == 'wrong-password') {
          TostDialog.TostDil("Password salah");
        } else {
          TostDialog.TostDil('${e.toString()}');
        }
      } catch (e) {
        isLoading.value = false;
        TostDialog.TostDil('${e.toString()}');
      }
    } else {
      TostDialog.TostDil('email dan passowrd harus diisi');
    }
  }
}
