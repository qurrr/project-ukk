import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:kantin/admin/controller/controlleradmin.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TambahuserPage(),
    );
  }
}

class TambahuserPage extends StatefulWidget {
  @override
  _TambahuserPageState createState() => _TambahuserPageState();
}

class _TambahuserPageState extends State<TambahuserPage> {
  final controller = Get.find<tambahusercontroller>();
  int active = 0;

  final List<String> items = [
    'admin',
    'kasir',
    'manager',
  ];
  String? selectedValue;
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
            title: Text("Tambah user"),
            titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 6, 1, 61)),
            centerTitle: true,
          ),
          body: ListView(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Nama",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 7),
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 5,
                          spreadRadius: 0)
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: controller.namaC,
                  autocorrect: false,
                  showCursor: true,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    hintText: ' Nama',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 7),
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 5,
                          spreadRadius: 0)
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: controller.emailC,
                  autocorrect: false,
                  showCursor: true,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    hintText: ' Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 7),
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 5,
                          spreadRadius: 0)
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: controller.passC,
                  autocorrect: false,
                  showCursor: true,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    hintText: ' Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Jenis Kelamin",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 7),
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 5,
                          spreadRadius: 0)
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: controller.jenkelC,
                  autocorrect: false,
                  showCursor: true,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    hintText: ' jeniskelamin',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.only(left: 5),
                height: 45,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 5,
                      spreadRadius: 0)
                ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'typeuser',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                    value: controller.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        controller.selectedValue = value.toString();
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 200, top: 20, bottom: 20),
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 5,
                        spreadRadius: 0)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: MaterialButton(
                  child: Text(
                    'Tambah',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 43, 78),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    controller.tambahuser(context);
                  },
                ),
              )
            ],
          )),
    );
  }
}
