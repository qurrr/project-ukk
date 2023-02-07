import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Manager/Editmenu/Makanan/Authmakanan.dart';
import 'package:get/get.dart';
import 'package:kantin/Routing/Routes.dart';
import 'package:kantin/Homemenu/Makanan/controlhomemakanan.dart';
import 'package:kantin/Homemenu/Coffe/controlhomecoffe.dart';

class Homecoffeview extends StatefulWidget {
  @override
  _HomecoffeviewState createState() => _HomecoffeviewState();
}

class _HomecoffeviewState extends State<Homecoffeview> {
  final controller = Get.find<controlhomecoffe>();
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
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: controller.streamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var listmin = snapshot.data!.docs;
          return GridView.builder(
            itemCount: listmin.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 230,
            ),
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2, 5),
                    blurRadius: 5,
                  )
                ],
              ),
              // height: 200,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                          image: NetworkImage(
                            "${(listmin[index].data() as Map<String, dynamic>)["profil"]}",
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Text(
                            "${(listmin[index].data() as Map<String, dynamic>)["nama"]}",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${(listmin[index].data() as Map<String, dynamic>)["typeuser"]}",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${(listmin[index].data() as Map<String, dynamic>)["id"]}",
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 24, 38, 88),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${(listmin[index].data() as Map<String, dynamic>)["harga"]}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 24, 38, 88),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 70,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 24, 38, 88),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Buy",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
