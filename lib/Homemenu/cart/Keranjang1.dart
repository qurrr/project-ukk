import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Homemenu/cart/cartcontrol.dart';
import 'package:kantin/Homemenu/cart/cartitem.dart';
import 'package:kantin/Homemenu/cart/controllercart.dart';
import 'package:kantin/Homemenu/cart/modelcart.dart';

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  Rx<CartItemModel> cartmodel = CartItemModel().obs;
  @override
  Widget build(BuildContext context) {
    cartController.Modelcart.forEach((element) {
      cartmodel.value.subTotal += element.price! * element.quantity!;
    });

    if (cartController.Modelcart.isEmpty) {
      cartmodel.value.subTotal = 0;
    }
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
        body: Stack(children: [
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 60,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 6, 1, 61),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Total Bayar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "\$ ${cartmodel.value.subTotal.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  RaisedButton(
                    onPressed: () {
                      cartController.paymentAdd();
                    },
                    child: Text("bayar",
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 1, 61),
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
