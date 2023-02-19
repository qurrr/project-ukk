import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Homemenu/cart/cartcontrol.dart';
import 'package:kantin/Homemenu/cart/modelcart.dart';

class CardItemWidget extends StatelessWidget {
  final Map<String,dynamic> cartItem;

  const CardItemWidget({Key? key, required this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(top: 10),
      height: 90,
     
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(73, 0, 0, 0),
            offset: const Offset(
              0.0,
              0.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.black,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              image: DecorationImage(
                image: NetworkImage(cartItem["image"].toString(),),
                fit: BoxFit.cover,
              ),
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem["name"].toString(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "${cartItem["quantity"].toString()}x",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  cartItem["category"].toString(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 130,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  cartItem["id"].toString(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 24, 38, 88),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 19,
                  ),
                  child: Text(
                    cartItem["price"].toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
