import 'package:flutter/material.dart';
import 'package:kantin/kasir/Kasir.dart';
import '../main.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import './controller/authregist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:kantin/Routing/Routes.dart';

class Register1Page extends StatefulWidget {
  @override
  _Register1PageState createState() => _Register1PageState();
}

class _Register1PageState extends State<Register1Page> {
  final controller = Get.find<RegistController>();
  final List<String> items = [
    'admin',
    'kasir',
    'manager',
  ].obs;

  bool showPassword = false;
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100),
              width: MediaQuery.of(context).size.width,
              height: 180,
              color: Colors.white,
              child: Text(
                "Coffe Shop",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 27, 50),
                    fontSize: 40,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Flexible(
                child: Container(
                    padding: EdgeInsets.only(
                      right: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(25)),
                      color: Color.fromARGB(255, 0, 35, 63),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25, top: 10),
                          child: Text(
                            "Nama",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 25,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: TextField(
                            //eror controller auth
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            controller: controller.nameC,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25, top: 10),
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 25,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            controller: controller.emailC,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: buildTextField("", true),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25, top: 10),
                          child: Text(
                            "Jenis kelamin",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 25,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            controller: controller.jenkelC,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => Container(
                            margin: EdgeInsets.only(left: 25, right: 210),
                            padding: EdgeInsets.only(left: 5),
                            height: 30,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
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
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
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
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 27),
                                height: 45,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: MaterialButton(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 43, 78),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () => Get.back(),
                                ),
                              ),
                              Container(
                                height: 45,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: MaterialButton(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 43, 78),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    controller.regist(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String placeholder, bool isPasswordTextField) {
    return Obx(
      () => TextField(
        obscureText: controller.obsecureText.value,
        controller: controller.passC,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: IconButton(
            icon: (controller.obsecureText != true)
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
            onPressed: () {
              controller.obsecureText.value = !(controller.obsecureText.value);
            },
          ),
          hintText: placeholder,
        ),
      ),
    );
  }
}
