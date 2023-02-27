import 'package:kantin/Sidebar/controller.dart';
import 'package:kantin/admin/controller/controlleradmin.dart';
import 'package:get/instance_manager.dart';

class Tambahuserbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<tambahusercontroller>(
      () => tambahusercontroller(),
    );
    Get.lazyPut<sidebarController>(
      () => sidebarController(),
    );
  }
}
