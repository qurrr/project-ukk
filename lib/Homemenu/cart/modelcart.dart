class CartItemModel {
  static const ID = "id";
  static const IMAGE = "foto";
  static const NAME = "nama";
  static const QUANTITY = "quantity";
  // static const COST = "cost";
  static const PRICE = "harga";
  static const CATEGORY = "category";

  String? id;
  String? image;
  String? name;
  String? quantity;
  // double cost;
  String? price;
  String? category;

  CartItemModel({
    this.category,
    this.id,
    this.image,
    this.name,
    this.quantity,
  });

  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    quantity = data[QUANTITY];
    // cost = data[COST].toDouble();
    price = data[PRICE];
    category = data[category];
  }

  Map toJson() => {
        ID: id,
        CATEGORY: category,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        // COST: price * quantity,
        PRICE: price
      };
}
