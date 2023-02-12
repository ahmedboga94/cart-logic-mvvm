import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sumtotal/view/widgets/product_card.dart';
import 'package:sumtotal/model/cart_model.dart';
import 'package:sumtotal/model/product_model.dart';
import 'package:sumtotal/viewModel/cart_view_model.dart';
import 'package:sumtotal/view/cart_view.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  List<ProductModel> items = [
    ProductModel(
        image:
            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
        name: "Piza",
        desc: "Piza is my Favo....",
        price: 2.88),
    ProductModel(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ02o6hJho_3k3Rhbow9IL6pToV1JVqi2OHXFprdFV2GoHJQWEy&usqp=CAU",
        name: "Sandwitch",
        desc: "Sandwitch is my Favo....",
        price: 1.88),
    ProductModel(
        image:
            "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?cs=srgb&dl=pexels-ash-376464.jpg&fm=jpg",
        name: "Fish",
        desc: "Fish is my Favo....",
        price: 3.88),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Food List"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Badge(
                isLabelVisible: context.watch<CartViewModel>().items.isNotEmpty
                    ? true
                    : false,
                label: Text(
                  context.watch<CartViewModel>().items.length.toString(),
                ),
                child: IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {
                      // go to screen order
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartView()));
                    }),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            ProductModel productData = items[index];
            return ProductCard(
              name: productData.name,
              image: productData.image,
              price: productData.price,
              description: productData.desc,
              addOnTap: () {
                CartModel order = CartModel(
                    product: productData, qty: 1, price: productData.price);
                context.read<CartViewModel>().addOrder(order);
              },
            );
          },
        ));
  }
}
