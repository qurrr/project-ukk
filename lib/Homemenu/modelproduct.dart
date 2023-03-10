import 'dart:ffi';

class ProductModel {
  static const ID = "id";
  static const NAMA = "nama";
  static const CATEGORY = "typeuser";
  static const HARGA = "harga";
  static const FOTO = "profil";

  String? id;
  String? name;
  String? category;
  String? harga;
  String? foto;

  ProductModel(
      {this.id, this.name, this.category, required this.harga, this.foto});

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    name = data[NAMA];
    category = data[CATEGORY];
    harga = data[HARGA];
    foto = data[FOTO];
  }
}
