import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';
import 'package:get/get.dart';
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
    return ListView(
      children: [
        Obx(() => Column(
                children: kasirController.pesanans.map((PaymentsModel pesanan) {
              return KasirItemWidget(
                itempemesanan: pesanan,
              );
            }).toList()))
      ],
    );
  }
}
