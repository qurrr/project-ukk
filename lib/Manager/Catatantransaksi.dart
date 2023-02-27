import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Manager/controller/controller.dart';
import 'package:kantin/Routing/Routes.dart';
import 'package:kantin/kasir/controller/controller.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatatanPage(),
    );
  }
}

class CatatanPage extends StatefulWidget {
  @override
  _CatatanPageState createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
              child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(255, 6, 1, 61),
            ),
          )),
          title: Text("Catatan transaksi"),
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 6, 1, 61)),
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: historyController.getAllhistory(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var datahistory = snapshot.data!.docs;
              const initialValue = 0.00;
              final result = datahistory.fold<double>(initialValue,
                  (previousValue, element) => previousValue + element["total"]);
              return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 590,
                        child: ListView.builder(
                          itemCount: datahistory.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.toNamed(
                              Routes.DETAILRIWAYAT,
                              arguments: datahistory[index].data(),
                            ),
                            child: Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 5,
                                        spreadRadius: 0,
                                      )
                                    ]),
                                height: 90,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            (datahistory[index].data() as Map<
                                                String, dynamic>)["createdAt"],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Text(
                                          //   "001",
                                          //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                          // ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Kasir :${(datahistory[index].data() as Map<String, dynamic>)["kasir"]}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Pelanggan :${(datahistory[index].data() as Map<String, dynamic>)["nama"]}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Total pendapatan",
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            (datahistory[index].data() as Map<
                                                    String, dynamic>)["total"]
                                                .toString(),

                                            // kasirController.total2h.toString(),
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Total Bulanan",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              result.toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),

        // ListView(
        //   padding: EdgeInsets.symmetric(horizontal: 15),
        //   children: [pendapatanh()],
        // )
      ),
    );
  }
}
