import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kantin/Homemenu/modelproduct.dart';
import 'package:get/get.dart';
import 'package:kantin/Homemenu/Coffe/controller.dart';
import 'package:kantin/Homemenu/Coffe/productsingle.dart';

class Homecoffeview extends StatefulWidget {
  @override
  _HomecoffeviewState createState() => _HomecoffeviewState();
}

class _HomecoffeviewState extends State<Homecoffeview> {
  int active = 0;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Obx(() => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: producsController.products.map((ProductModel product) {
          return SingleProductWidget(
            product: product,
          );
        }).toList()));
  }
}
