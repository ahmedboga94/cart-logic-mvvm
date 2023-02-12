import 'package:flutter/cupertino.dart';
import '../model/cart_model.dart';

class CartViewModel extends ChangeNotifier {
  List<CartModel> items = [];

  void addOrder(CartModel order) {
    // check list product in item
    final i = items.indexWhere((e) => e.product == order.product);
    if (i > -1) {
      items[i].qty += order.qty;
    } else {
      items.add(order);
    }
    notifyListeners();
  }

  void removeOrder(CartModel order) {
    items.remove(order);
    notifyListeners();
  }

  void decrementQty(CartModel order) {
    final i = items.indexWhere((e) => e.product == order.product);
    if (items[i].qty == 1) {
      removeOrder(order);
    } else {
      items[i].qty -= 1;
      notifyListeners();
    }
  }

  void incrementQty(CartModel order) {
    items[items.indexOf(order)].qty += 1;
    notifyListeners();
  }

  double sumOfAllProductsInCart() {
    double totalPrices = 0.0;
    for (int i = 0; items.length > i; i++) {
      totalPrices += (items[i].price) * (items[i].qty);
    }
    return totalPrices;
  }
}
