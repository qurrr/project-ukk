import 'package:kantin/Manager/Editmenu/Tambahmenu/Authtambahmenu.dart';
import 'package:kantin/Manager/Editmenu/Minuman/Authminuman.dart';
import 'package:kantin/Manager/Editmenu/Makanan/Authmakanan.dart';
import 'package:kantin/Manager/Editmenu/Coffe/Authcoffe.dart';
import 'package:get/instance_manager.dart';

class Tambahmenbind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMenuAuth>(
      () => EditMenuAuth(),
    );
    Get.lazyPut<Authminuman>(
      () => Authminuman(),
    );
    Get.lazyPut<Authmakanan>(
      () => Authmakanan(),
    );
    Get.lazyPut<Authcoffe>(
      () => Authcoffe(),
    );
  }
}
