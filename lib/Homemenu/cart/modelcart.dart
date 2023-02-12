// import 'package:kantin/Homemenu/modelproduct.dart';

// class CartItemModel {
//   static const ID = "id";
//   static const IMAGE = "foto";
//   static const NAME = "nama";
//   static const QUANTITY = "quantity";
//   // static const COST = "cost";
//   static const PRICE = "harga";
//   static const CATEGORY = "category";

//   String? id;
//   String? image;
//   String? name;
//   String? quantity;
//   // double cost;
//   String? price;
//   String? category;
  

//   CartItemModel({
//     this.category,
//     this.id,
//     this.image,
//     this.name,
//     this.quantity,
//   });

//   CartItemModel.fromMap(Map<String, dynamic> data) {
//     id = data[ID];
//     image = data[IMAGE];
//     name = data[NAME];
//     quantity = data[QUANTITY];
//     // cost = data[COST].toDouble();
//     price = data[PRICE];
//     category = data[category];
//   }

//   // Map toJson() => {
//   //       ID: id,
//   //       CATEGORY: category,
//   //       IMAGE: image,
//   //       NAME: name,
//   //       QUANTITY: quantity,
//   //       // COST: price * quantity,
//   //       PRICE: price
//   //     };
// }
class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const PRICE = "price";
  static const CATEGORY = "category";

  String? id;
  String? image;
  String? name;
  String? quantity;
  String? price;
  String? category;

  CartItemModel({this.id, this.name, this.category, this.price, this.quantity, this.image});

  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    name = data[NAME];
    category = data[CATEGORY];
    quantity = data[QUANTITY];
    price = data[PRICE];
    image = data[IMAGE];
  }
}
