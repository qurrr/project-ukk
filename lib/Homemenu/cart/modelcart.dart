import 'package:kantin/Homemenu/modelproduct.dart';

class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const PRICE = "price";
  static const CATEGORY = "category";

  late String? id;
  late String? image;
  late String? name;
  late int? quantity;
  late int? price;
  late String? category;

  CartItemModel({
    this.category,
    this.id,
    this.image,
    this.name,
    this.quantity,
    this.price,
  });

  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    quantity = data[QUANTITY];
    price = data[PRICE];
    category = data[CATEGORY];
  }

  Map toJson() => {
        ID: id,
        CATEGORY: category,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        PRICE: price
      };
}
// class CartItemModel {
//   static const ID = "id";
//   static const IMAGE = "image";
//   static const NAME = "name";
//   static const QUANTITY = "quantity";
//   static const PRICE = "price";
//   static const CATEGORY = "category";

//   String? id;
//   String? image;
//   String? name;
//   int? quantity;
//   String? price;
//   String? category;

//   CartItemModel(
//       {this.id,
//       this.name,
//       this.category,
//       this.price,
//       this.quantity,
//       this.image});

//   CartItemModel.fromMap(Map<String, dynamic> data) {
//     id = data[ID];
//     name = data[NAME];
//     category = data[CATEGORY];
//     quantity = data[QUANTITY];
//     price = data[PRICE];
//     image = data[IMAGE];
//   }
// }
