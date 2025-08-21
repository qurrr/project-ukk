import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';
import 'package:get/get.dart';
import 'package:kantin/kasir/Kasiritemwidget.dart';
import 'package:kantin/kasir/controller/controller.dart';

class PesananSelesai extends StatefulWidget {
  @override
  _PesananSelesaiState createState() => _PesananSelesaiState();
}

class _PesananSelesaiState extends State<PesananSelesai> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ListView(
      children: [
        Obx(() => Column(
                children:
                    kasirHistory.pesananselesai.map((PaymentsModel pesanan) {
              return KasirItemWidget(
                itempemesanan: pesanan,
              );
            }).toList()))
      ],
    );
  }
}
