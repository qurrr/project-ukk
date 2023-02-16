import 'package:kantin/Homemenu/Minuman/controlhomemin.dart';
import 'package:kantin/Homemenu/Makanan/controlhomemakanan.dart';
import 'package:kantin/Homemenu/Coffe/controlhomecoffe.dart';
import 'package:get/instance_manager.dart';
import 'package:kantin/Homemenu/cart/controllercart.dart';
import 'package:kantin/kasir/controller/controllerkasir.dart';

class BindingKasir extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KasirController>(
      () => KasirController(),
    );
  }
}
