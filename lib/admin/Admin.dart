import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Routing/Routes.dart';
import 'package:kantin/Sidebar/sidebar.dart';
import 'package:kantin/admin/controller/controlleradmin.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
          drawer: SideBarWidget(),
          appBar: AppBar(
            iconTheme:
                IconThemeData(color: Color.fromARGB(255, 6, 1, 61), size: 28),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("Admin"),
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
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.TAMBAHUSER),
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 32, 58),
                              borderRadius: BorderRadius.circular(5)),
                          height: 40,
                          width: 150,
                          child: Text(
                            "Tambah user",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.LOGAKTIV),
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 32, 58),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Log Aktivitas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Akun pengguna",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${(users[index].data() as Map<String, dynamic>)["nama"]}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
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
                                            "jenkel",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${(users[index].data() as Map<String, dynamic>)["jeniskelamin"]}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${(users[index].data() as Map<String, dynamic>)["typeuser"]}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
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
                                      onTap: () => controller
                                          .deleteuser(users[index].id),
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        width: 120,
                                        height: 40,
                                        child: Text(
                                          "Hapus",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    GestureDetector(
                                      onTap: () => Get.toNamed(
                                        Routes.EDITUSER,
                                        arguments: users[index].id,
                                      ),
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        width: 120,
                                        height: 40,
                                        child: Text(
                                          "Edit",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 7, 204, 0),
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                ))
              ],
            ),
          )),
    );
  }
}
