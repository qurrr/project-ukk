import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';
import 'package:kantin/kasir/carditem.dart';
import 'package:kantin/kasir/controller/controller.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailPage(),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // final Map<String, dynamic> itempemesanan = Get.arguments;
  final PaymentsModel itempemesanan = Get.arguments;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: kasirController.streamUser(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              Map<String, dynamic> user = snapshot.data!.data()!;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: Container(
                      child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color.fromARGB(255, 6, 1, 61),
                    ),
                  )),
                  title: Text("Pesanan ${itempemesanan.nama.toString()}"),
                  titleTextStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 6, 1, 61)),
                  centerTitle: true,
                ),
                body: Stack(children: [
                  ListView(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 10),
                    children: [
                      Text(
                        itempemesanan.createdAt.toString(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pelanggan :${itempemesanan.nama.toString()}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text('Kasir :${user["nama"]}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: itempemesanan.cart!
                            .map((item) => CardItemWidget(
                                  cartItem: item,
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                  (itempemesanan.status == 0)
                      ? Align(
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
                                        itempemesanan.total.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 110,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    kasirController.updatedata(
                                        itempemesanan, user["nama"]);
                                  },
                                  child: Text("telah bayar",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 6, 1, 61),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 0,
                        ),
                ]),
              );
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return Center(child: Text("Error"));
          }
        });
  }

  Widget CoffeP() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.symmetric(horizontal: 25),
      height: 90,
      width: 180,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
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
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              image: DecorationImage(
                image: AssetImage("assets/food/mie ayam.jpeg"),
                fit: BoxFit.cover,
              ),
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mie ayam",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "2x",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Makanan",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 130,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "f01",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 24, 38, 88),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 19,
                  ),
                  child: Text(
                    "Rp.80.000",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
