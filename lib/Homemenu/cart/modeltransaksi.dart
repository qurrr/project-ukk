class PaymentsModel {
  static const NAMA = "nama";
  static const CART = "cart";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  late String nama;
  late String total;
  late String status;
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
    cart = data[CART];
  }
}
