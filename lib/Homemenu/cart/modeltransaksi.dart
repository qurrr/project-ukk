import 'package:kantin/Homemenu/cart/modelcart.dart';

class PaymentsModel {
  static const NAMA = "nama";
  static const CART = "cart";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  late String nama;
  late String total;
  late int status;
  late int createdAt;
  late List cart;

  PaymentsModel(
      {required this.nama,
      required this.total,
      required this.status,
      required this.createdAt,
      required this.cart});

  PaymentsModel.fromMap(Map data) {
    nama = data[NAMA];
    createdAt = data[CREATED_AT];
    total = data[TOTAL];
    status = data[STATUS];
    cart = _convertCartItems(data[CART] ?? []);
  }
    List<CartItemModel> _convertCartItems(List cartFomDb){
    List<CartItemModel> _result = [];
    if(cartFomDb.length > 0){
      cartFomDb.forEach((element) {
      _result.add(CartItemModel.fromMap(element));
    });
    }
    return _result;
  }
   List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}
