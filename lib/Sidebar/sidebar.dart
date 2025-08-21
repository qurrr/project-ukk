import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kantin/Routing/Routes.dart';
import 'package:kantin/Sidebar/cantrol.dart';

class SideBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: sidebarcontroller.streamUser(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              Map<String, dynamic> user = snapshot.data!.data()!;
              return Drawer(
                child: ListView(children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 24, 38, 88),
                    ),
                    accountName: Text(
                      user["nama"].toString(),
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    accountEmail: Text(user["email"].toString(),
                        style: TextStyle(color: Colors.white)),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.LOGIN),
                    child: Container(
                      width: 190,
                      height: 55,
                      margin: EdgeInsets.only(left: 10, top: 15, right: 20),
                      padding: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 24, 38, 88),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 33,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              );
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return Center(child: Text("Error"));
          }
        });
  }
}
