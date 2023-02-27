import 'package:kantin/Homemenu/Minuman/controlhomemin.dart';
import 'package:kantin/Homemenu/Makanan/controlhomemakanan.dart';
import 'package:kantin/Homemenu/Coffe/controlhomecoffe.dart';
import 'package:get/instance_manager.dart';
import 'package:kantin/Homemenu/cart/controllercart.dart';
import 'package:kantin/Sidebar/controller.dart';
import 'package:kantin/kasir/pesanansekarang/controllerkasir.dart';
import 'package:kantin/kasir/pesananselesai/controllerkasir.dart';

import '../pesanansekarang/controllerkasir.dart';

class BindingKasir extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<sidebarController>(
      () => sidebarController(),
    );
    Get.lazyPut<KasirController>(
      () => KasirController(),
    );
    Get.lazyPut<HistoryKasir>(
      () => HistoryKasir(),
    );
  }
}
