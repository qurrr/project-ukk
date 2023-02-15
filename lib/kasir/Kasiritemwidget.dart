import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Homemenu/cart/cartcontrol.dart';
import 'package:kantin/Homemenu/cart/modelcart.dart';
import 'package:kantin/Homemenu/cart/modeltransaksi.dart';

class KasirItemWidget extends StatelessWidget {
  final PaymentsModel itempemesanan;

  const KasirItemWidget({Key? key, required this.itempemesanan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(bottom: 15, left: 8, right: 8),
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
                image: NetworkImage(
                  cartItem.image.toString(),
                ),
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
                  cartItem.name.toString(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  cartItem.category.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
                Text(
                  cartItem.price.toString(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 24, 38, 88),
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
                  cartItem.id.toString(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 24, 38, 88),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 19,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // IconButton(
                          // onPressed: _incrementCount,
                          // icon:
                          IconButton(
                            onPressed: () {
                              cartController.decreaseQuantity(cartItem);
                            },
                            icon: Icon(
                              Icons.do_disturb_on_sharp,
                              size: 25,
                              color: Color.fromARGB(255, 24, 38, 88),
                            ),
                          ),
                          // ),
                          Container(
                            width: 20,
                            child: Text(
                              cartItem.quantity.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          // IconButton(
                          //     onPressed: _decrementCount,
                          //     icon:
                          IconButton(
                            onPressed: () {
                              cartController.increaseQuantity(cartItem);
                            },
                            icon: Icon(
                              Icons.add_circle_rounded,
                              size: 25,
                              color: Color.fromARGB(255, 24, 38, 88),
                            ),
                          ),
                          // ),
                        ]),
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
