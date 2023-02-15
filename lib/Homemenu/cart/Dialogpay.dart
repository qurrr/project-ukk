import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog {
  static confirmPelanggan({
    required String title,
    required String message,
    required void Function() onConfirm,
    required void Function() onCancel,
    required TextEditingController controller,
  }) {
    Get.defaultDialog(
      title: "TOTAL PEMBAYARAN",
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    message,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      height: 150 / 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onCancel,
                    child: Text(
                      "BATAL",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      primary: Colors.blue,
                      elevation: 0,
                      onPrimary: Colors.green,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    child: Text("BAYAR"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
