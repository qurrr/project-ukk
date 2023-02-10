import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Manager/Editmenu/Minuman/Authminuman.dart';
import 'package:get/get.dart';
import 'package:kantin/Routing/Routes.dart';
import 'package:kantin/Homemenu/Minuman/controlhomemin.dart';
import 'package:kantin/Homemenu/Minuman/productsingle.dart';
import 'package:kantin/Homemenu/Minuman/controller.dart';

import '../modelproduct.dart';



class Homeminuman extends StatefulWidget {
  @override
  _HomeminumanState createState() => _HomeminumanState();
}

class _HomeminumanState extends State<Homeminuman> {
  int _ongkir = 100;
  int _count = 1;
  int _selectedItemIndex = 0;
  int active = 0;
  void _incrementCount() {
    setState(() {
      _count--;
    });
  }

  void _decrementCount() {
    setState(() {
      _count++;
    });
  }

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
