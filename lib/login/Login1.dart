import 'package:flutter/material.dart';
import 'package:kantin/login/auth/Authlogin.dart';
import '../main.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kantin/regist/controller/authregist.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import './auth/Authlogin.dart';
import 'package:kantin/Routing/Routes.dart';

class Login1Page extends GetView<LoginController> {
  String? selectedValue;
  bool showPassword = false;
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    // final penggunal = Provider.of<PenggunaLog>(context, listen: false);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100),
              width: MediaQuery.of(context).size.width,
              height: 200,
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
                    padding: EdgeInsets.only(right: 20),
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
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25, top: 20),
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
                            controller: controller.emailC,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "email",
                            ),
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
                        SizedBox(height: 17),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
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
                                    'Daftar',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 43, 78),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.REGISTRATION);
                                  },
                                ),
                              ),
                              Container(
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
                                  onPressed: () async {
                                    if (controller.isLoading.isFalse) {
                                      await controller.Loginauth();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )))
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
