import 'package:get/get.dart';
import 'package:kantin/Manager/controller/controllerhistory.dart';
import 'package:kantin/Sidebar/controller.dart';
import 'package:kantin/admin/controller/controlleradmin.dart';
import 'package:kantin/kasir/pesanansekarang/controllerkasir.dart';
import 'package:kantin/kasir/pesananselesai/controllerkasir.dart';

class Bindingmanager extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<tambahusercontroller>(
      () => tambahusercontroller(),
    );
    Get.lazyPut<sidebarController>(
      () => sidebarController(),
    );
    Get.lazyPut<ManagerController>(
      () => ManagerController(),
    );
    Get.lazyPut<KasirController>(
      () => KasirController(),
    );
    Get.lazyPut<KasirController>(
      () => KasirController(),
    );
    Get.lazyPut<tambahusercontroller>(
      () => tambahusercontroller(),
    );
    Get.lazyPut<HistoryKasir>(
      () => HistoryKasir(),
    );
  }
}
