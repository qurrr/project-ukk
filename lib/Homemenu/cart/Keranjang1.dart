import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Homemenu/cart/cartcontrol.dart';
import 'package:kantin/Homemenu/cart/cartitem.dart';
import 'package:kantin/Homemenu/cart/controllercart.dart';
import 'package:kantin/Homemenu/cart/modelcart.dart';
import 'package:kantin/Homemenu/cart/Dialogpay.dart';

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  Rx<CartItemModel> cartmodel = CartItemModel().obs;
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
                child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(255, 6, 1, 61),
            )),
          ),
          title: Text("Keranjang"),
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 6, 1, 61)),
          centerTitle: true,
        ),
        body: Stack(alignment: Alignment.center, children: [
          ListView(
            padding: EdgeInsets.only(top: 10),
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                width: 30,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(73, 0, 0, 0),
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: TextField(
                  controller: cartController.namapelangganC,
                  decoration: InputDecoration(
                    hintText: "Isi dengan nama anda",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => Column(
                    children:
                        cartController.Modelcart.map((CartItemModel cartItem) {
                      return CartItemWidget(
                        cartItem: cartItem,
                      );
                    }).toList(),
                  )),
              SizedBox(
                height: 80,
              )
            ],
          ),
          Positioned(
            top: 580,
            child: FloatingActionButton(
              onPressed: () {
                CustomAlertDialog.confirmPelanggan(
                  title: "TOTAL PESANAN",
                  message: "\Rp ${cartController.subtotal}",
                  onConfirm: () {
                    cartController.paymentAdd();
                    Get.back();
                    Get.back();
                  },
                  onCancel: () {
                    Get.back();
                  },
                );
              },
              child: Text("Bayar"),
            ),
          )
        ]));
  }
}
