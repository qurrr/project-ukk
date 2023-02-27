import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:kantin/Sidebar/controller.dart';

import '../../kasir/pesanansekarang/controllerkasir.dart';

class BindingCart extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KasirController>(
      () => KasirController(),
    );
    Get.lazyPut<sidebarController>(
      () => sidebarController(),
    );
  }
}
