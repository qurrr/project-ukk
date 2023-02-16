import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';
import 'package:kantin/Manager/Editmenu/Minuman/Authminuman.dart';
import 'package:get/get.dart';
import 'package:kantin/Routing/Routes.dart';
import 'package:kantin/Homemenu/Minuman/controlhomemin.dart';
import 'package:kantin/Homemenu/Minuman/productsingle.dart';
import 'package:kantin/Homemenu/Minuman/controller.dart';
import 'package:kantin/kasir/Kasiritemwidget.dart';
import 'package:kantin/kasir/controller/controller.dart';

class PesananSekarang extends StatefulWidget {
  @override
  _PesananSekarangState createState() => _PesananSekarangState();
}

class _PesananSekarangState extends State<PesananSekarang> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Obx(() => Column(
            children: kasirController.pesanans.map((PaymentsModel pesanan) {
          return KasirItemWidget(
            itempemesanan: pesanan,
          );
        }).toList()));
  }
}
