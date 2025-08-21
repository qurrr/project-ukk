import 'package:get/instance_manager.dart';
import 'package:kantin/Sidebar/controller.dart';
import 'package:kantin/kasir/pesanansekarang/controllerkasir.dart';
import 'package:kantin/kasir/pesananselesai/controllerkasir.dart';


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
