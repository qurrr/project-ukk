import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kantin/Homemenu/cart/cartcontrol.dart';

import '../modelproduct.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;

  const SingleProductWidget({Key? key, required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(2, 5),
            blurRadius: 5,
          )
        ],
      ),
      // height: 200,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                image: DecorationImage(
                  image: NetworkImage(
                    product.foto.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.red,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Text(
                    product.name.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    product.category.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              product.id.toString(),
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 24, 38, 88),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product.harga.toString(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 24, 38, 88),
                  ),
                ),
                InkWell(
                  onTap: () {
                    cartController.addProductToCart(product);
                  },
                  child: Container(
                    width: 70,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 24, 38, 88),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Buy",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
