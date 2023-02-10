import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Homemenu/cart/controllercart.dart';
import 'package:kantin/Homemenu/cart/modelcart.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KeranjangPage(),
    );
  }
}

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {

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
                margin: EdgeInsets.symmetric(horizontal: 50),
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
                  decoration: InputDecoration(
                    hintText: "Isi dengan nama anda",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CoffeP()
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
                          "Rp 80.000",
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
                    onPressed: () {},
                    child: Text("bayar",
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
        ]));
  }

  Widget CoffeP() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.symmetric(horizontal: 35),
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
                  "Makanan",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Rp.8.000",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 24, 38, 88),
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
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 19,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: _incrementCount,
                              icon: Icon(
                                Icons.do_disturb_on_sharp,
                                size: 25,
                                color: Color.fromARGB(255, 24, 38, 88),
                              )),
                          Container(
                            width: 20,
                            child: Text(
                              "${_count}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                              onPressed: _decrementCount,
                              icon: Icon(
                                Icons.add_circle_rounded,
                                size: 25,
                                color: Color.fromARGB(255, 24, 38, 88),
                              )),
                        ]),
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
