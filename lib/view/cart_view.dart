import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sumtotal/model/cart_model.dart';
import '../viewModel/cart_view_model.dart';
import 'widgets/cart_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Order')),
        body: Consumer<CartViewModel>(
          builder: (context, cartOrders, child) => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartOrders.items.length,
                  itemBuilder: (context, index) {
                    CartModel cartData = cartOrders.items[index];
                    return CartCard(
                      name: cartData.product.name,
                      image: cartData.product.image,
                      productQuantity: cartData.qty,
                      totalPrice: cartData.qty * cartData.price,
                      incrementQtyTap: () => cartOrders.incrementQty(cartData),
                      decrementQtyTap: () => cartOrders.decrementQty(cartData),
                    );
                  },
                ),
              ),
              ListTile(
                  title: const Text("Total Price",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  trailing: Text(
                    "${cartOrders.sumOfAllProductsInCart().toStringAsFixed(2)} L.E.",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  )),
              const SizedBox(height: 20)
            ],
          ),
        ));
  }
}
