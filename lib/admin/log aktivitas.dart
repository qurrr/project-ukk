import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/admin/controller/controlleradmin.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogaktifitasPage(),
    );
  }
}

class LogaktifitasPage extends StatefulWidget {
  @override
  _LogaktifitasPageState createState() => _LogaktifitasPageState();
}

class _LogaktifitasPageState extends State<LogaktifitasPage> {
  final controller = Get.find<tambahusercontroller>();
  int _ongkir = 100;
  int _count = -0;
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            title: Text("Log aktivitas"),
            titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 6, 1, 61)),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "User",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Flexible(
                    child: StreamBuilder<QuerySnapshot<Object?>>(
                  stream: controller.streamData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      var users = snapshot.data!.docs;
                      return ListView.builder(
                          itemCount: users.length,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.symmetric(horizontal: 7),
                                height: 80,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Nama",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${(users[index].data() as Map<String, dynamic>)["nama"]}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "jeniskelamin",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${(users[index].data() as Map<String, dynamic>)["jeniskelamin"]}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Typeuser",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${(users[index].data() as Map<String, dynamic>)["typeuser"]}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  size: 10,
                                                ),
                                                Text(
                                                  "Aktif",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          // Container(
                                          //   child: Row(
                                          //     children: [
                                          //       Text(
                                          //         "Riwayat login :",
                                          //         style: TextStyle(
                                          //             fontSize: 15,
                                          //             fontWeight:
                                          //                 FontWeight.bold),
                                          //       ),
                                          //       Text(
                                          //         "1 menit",
                                          //         style: TextStyle(
                                          //             fontSize: 15,
                                          //             fontWeight:
                                          //                 FontWeight.bold),
                                          //       )
                                          //     ],
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ));
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ))
              ],
            ),
          )),
    );
  }
}
