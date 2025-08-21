import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kantin/Manager/Editmenu/Makanan/Authmakanan.dart';
import 'package:get/get.dart';
import 'package:kantin/Routing/Routes.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MakananMen(),
    );
  }
}

class MakananMen extends StatefulWidget {
  @override
  _MakananMenState createState() => _MakananMenState();
}

class _MakananMenState extends State<MakananMen> {
  final controller = Get.find<Authmakanan>();
  int active = 0;



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
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
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
                                "${(listmin[index].data() as Map<String, dynamic>)["id"]}",
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
                            width: 120,
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
                          onTap: () => Get.toNamed(Routes.EDITMENUMAK,
                              arguments: listmin[index].id),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: 120,
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
