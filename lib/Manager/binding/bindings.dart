import 'package:get/get.dart';
import 'package:kantin/Manager/controller/controllerhistory.dart';
import 'package:kantin/kasir/pesanansekarang/controllerkasir.dart';

class Bindingmanager extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerController>(
      () => ManagerController(),
    );
    Get.lazyPut<KasirController>(
      () => KasirController(),
    );
    Get.lazyPut<KasirController>(
      () => KasirController(),
    );
  }
}
