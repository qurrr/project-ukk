import 'package:kantin/Homemenu/modelproduct.dart';

class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const CATEGORY = "category";

  late String id;
  late String image;
  late String name;
  late int quantity;
  late double cost;
  late int price;
  late String category;

  CartItemModel({
    required this.category,
    required this.id,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.cost,
  });

  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    quantity = data[QUANTITY];
    cost = data[COST].toDouble();
    price = data[PRICE];
    category = data[CATEGORY];
  }

  Map toJson() => {
        ID: id,
        CATEGORY: category,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        COST: price * quantity,
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
