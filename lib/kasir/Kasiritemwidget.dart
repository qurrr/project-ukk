import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';
import 'package:kantin/Routing/Routes.dart';

class KasirItemWidget extends StatelessWidget {
  final PaymentsModel itempemesanan;

  const KasirItemWidget({Key? key, required this.itempemesanan})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
        // StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        //   stream: kasirController.streampesananpelanggan(),
        //   builder: (context, snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.active:
        //       case ConnectionState.done:
        //         Map<String, dynamic> pesananP = snapshot.data!.data()!;
        //         return
        OutlinedButton(
      // color: Colors.white,
      // shape: RoundedRectangleBorder(
      //   side: BorderSide(
      //     color: Colors.white70,
      //   ),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      onPressed: () {
        Get.toNamed(
          
          Routes.DETAILPESANAN,
          arguments: itempemesanan,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        height: 90,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0.0, 0.0),
                  color: Colors.black,
                  blurRadius: 3.0,
                  spreadRadius: 0.0)
            ]),
        child: Row(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "atas nama",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    itempemesanan.nama.toString(),
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 150,
            ),
            Text(
              itempemesanan.total.toString(),
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
    //     case ConnectionState.waiting:
    //       return Center(child: CircularProgressIndicator());
    //     default:
    //       return Center(child: Text("Error"));
    //   }
    // });
  }
}
