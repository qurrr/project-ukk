import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Manager/Editmenu/Minuman/Authminuman.dart';
import 'package:get/get.dart';
import 'package:kantin/Routing/Routes.dart';

class MinumanMen extends StatefulWidget {
  @override
  _MinumanMenState createState() => _MinumanMenState();
}

class _MinumanMenState extends State<MinumanMen> {
  final controller = Get.find<Authminuman>();
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
          return ListView.builder(
            itemCount: listmin.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(top: 15, left: 10, right: 10),
              padding: EdgeInsets.symmetric(horizontal: 7),
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        spreadRadius: 1,
                        blurRadius: 2)
                  ]),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ID",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${listmin[index].id}",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Nama",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${(listmin[index].data() as Map<String, dynamic>)["nama"]}",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${(listmin[index].data() as Map<String, dynamic>)["typeuser"]}",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              controller.deleteProduct(listmin[index].id),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: 150,
                            height: 40,
                            child: Text(
                              "Hapus",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.EDITMENUMIN,
                              arguments: listmin[index].id),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: 150,
                            height: 40,
                            child: Text(
                              "Edit",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 7, 204, 0),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
