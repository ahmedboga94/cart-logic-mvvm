import 'product_model.dart';

class CartModel {
  ProductModel product;
  int qty;
  double price;

  CartModel({required this.product, this.qty = 1, required this.price});
}
