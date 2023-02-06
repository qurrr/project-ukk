import '../controller/authregist.dart';
import 'package:get/instance_manager.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistController>(
      () => RegistController(),
    );
  }
}
