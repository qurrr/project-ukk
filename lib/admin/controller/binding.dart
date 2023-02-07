import 'package:kantin/admin/controller/controlleradmin.dart';
import 'package:get/instance_manager.dart';

class Tambahuserbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<tambahusercontroller>(
      () => tambahusercontroller(),
    );
  }
}
