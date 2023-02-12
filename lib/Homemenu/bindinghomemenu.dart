import 'package:kantin/Homemenu/Minuman/controlhomemin.dart';
import 'package:kantin/Homemenu/Makanan/controlhomemakanan.dart';
import 'package:kantin/Homemenu/Coffe/controlhomecoffe.dart';
import 'package:get/instance_manager.dart';

import 'cart/controllercart.dart';

class Bindinghomenu extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Productcontrollerminuman>(
      () => Productcontrollerminuman(),
    );
    Get.lazyPut<Productcontrollermakanan>(
      () => Productcontrollermakanan(),
    );
    Get.lazyPut<Productcontrollercoffe>(
      () => Productcontrollercoffe(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
