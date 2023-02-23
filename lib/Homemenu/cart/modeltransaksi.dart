import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kantin/Homemenu/cart/modelcart.dart';

class PaymentsModel {
  static const NAMA = "nama";
  static const CART = "cart";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";
  static const KASIR = "kasir";
  static const BULAN = "bulan";
  static const TANGGAL = "tanggal";

  String? nama;
  int? total;
  int? status;
  String? createdAt;
  String? kasir;
  String? bulan;
  String? tanggal;
  List<dynamic>? cart; //masalah

  PaymentsModel(
      {this.nama, this.total, this.status, this.createdAt, this.cart});
  PaymentsModel.fromSnapshot(DocumentSnapshot snapshot) {
    nama = (snapshot.data as DocumentSnapshot)[NAMA];
    createdAt = (snapshot.data as DocumentSnapshot)[CREATED_AT];
    total = (snapshot.data as DocumentSnapshot)[TOTAL];
    status = (snapshot.data as DocumentSnapshot)[STATUS];
    cart = _convertCartItems((snapshot.data as DocumentSnapshot)[CART] ?? []);
  }
  PaymentsModel.fromMap(Map data) {
    nama = data[NAMA];
    total = data[TOTAL];
    status = data[STATUS];
    cart = data[CART];
    kasir = data[KASIR];
    bulan = data[BULAN];
    tanggal = data[TANGGAL];
    createdAt = data[CREATED_AT];
  }
  List<CartItemModel> _convertCartItems(List cartFomDb) {
    List<CartItemModel> _result = [];
    if (cartFomDb.length > 0) {
      cartFomDb.forEach((element) {
        _result.add(CartItemModel.fromMap(element));
      });
    }
    return _result;
  }

  List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();
  Map toJson() => {
        NAMA: nama,
        TOTAL: total,
        STATUS: status,
        CART: cart,
        KASIR: kasir,
        BULAN: bulan,
        TANGGAL: tanggal,
        CREATED_AT: createdAt,
      };
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kantin/Homemenu/cart/modelcart.dart';


// class UserModel {
//   static const ID = "id";
//   static const NAME = "name";
//   static const EMAIL = "email";
//   static const CART = "cart";

//   String? id;
//   String? name;
//   String? email;
//   List<CartItemModel>? cart;

//   UserModel({this.id, this.name, this.email, this.cart});

//   UserModel.fromSnapshot(DocumentSnapshot snapshot) {
//     name = (snapshot.data as DocumentSnapshot)['username'];
//     email = (snapshot.data as DocumentSnapshot)['username'];
//     id = (snapshot.data as DocumentSnapshot)['username'];
//     cart = _convertCartItems(
//         (snapshot.data as DocumentSnapshot)['username'] ?? []);
//   }

//   List<CartItemModel> _convertCartItems(List cartFomDb) {
//     List<CartItemModel> _result = [];
//     if (cartFomDb.length > 0) {
//       cartFomDb.forEach((element) {
//         _result.add(CartItemModel.fromMap(element));
//       });
//     }
//     return _result;
//   }

//   List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
// }
