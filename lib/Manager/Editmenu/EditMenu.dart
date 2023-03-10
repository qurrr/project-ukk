import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:kantin/Manager/Editmenu/Tambahmenu/Authtambahmenu.dart';
import 'package:kantin/Manager/Editmenu/Makanan/Makanan.dart';
import 'package:kantin/Manager/Editmenu/Minuman/Minuman.dart';
import 'package:kantin/Manager/Editmenu/Tambahmenu/Tambahmenu.dart';
import 'package:kantin/Manager/Editmenu/Coffe/Coffe.dart';

class EditMenu extends StatefulWidget {
  @override
  _EditMenuState createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  int _ongkir = 100;
  int _count = -0;
  int _selectedItemIndex = 0;
  int active = 0;
  String? selectedValue;

  final List<String> items = [
    'Makanan',
    'Minuman',
    'Coffe',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return DefaultTabController(
      length: 4,
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
            title: Text("Editmenu"),
            titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 6, 1, 61)),
            centerTitle: true,
          ),
          body: ListView(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            children: [
              // Center(
              //   child: GetBuilder<EditMenuAuth>(
              //     builder: (controller) {
              //       if (controller.image != null) {
              //         return ClipOval(
              //           child: Container(
              //             width: 98,
              //             height: 98,
              //             color: Colors.lightBlue,
              //           ),
              //         );
              //       } else {
              //         return ClipOval(
              //           child: Container(
              //             width: 98,
              //             height: 98,
              //             color: Colors.lightBlue,
              //           ),
              //         );
              //       }
              //     },
              //   ),
              // ),
              Center(
                child: ClipOval(
                  child: Container(
                    width: 98,
                    height: 98,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        margin: EdgeInsets.only(top: 10),
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                  spreadRadius: 0,
                                  blurRadius: 2)
                            ]),
                        child: Text(
                          "Upload foto",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 1.0),
                                spreadRadius: 0,
                                blurRadius: 2)
                          ]),
                      child: Text(
                        "Hapus foto",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "ID",
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
                height: 20,
              ),
              Text(
                "Harga",
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
                  autocorrect: false,
                  showCursor: true,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    hintText: ' Harga',
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
                      'category',
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
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },

                    // (value) {
                    //   if (controller.isLoading.isFalse) {
                    //     controller.selectedValue = value;
                    //   }
                    //   // if (controller.isLoading.isFalse) {
                    //   // controller.selectedValue = value;
                    //   // }
                    // },
                    // (value) {
                    //   if (controller.isLoading.isFalse) {
                    //     controller.selectedValue = value;
                    //   }
                    //   // if (controller.isLoading.isFalse) {
                    //   // controller.selectedValue = value;
                    //   // }
                    // },

                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 240, top: 20, bottom: 20),
                height: 45,
                width: 120,
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
                    // setState(() {
                    //   controller.Addfood();

                    // }
                    // );
                  },
                ),
              )
            ],
          )),
    );
  }
}
