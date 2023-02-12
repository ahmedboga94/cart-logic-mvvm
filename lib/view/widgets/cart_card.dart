import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final String image, name;
  final int productQuantity;
  final double totalPrice;
  final Function() decrementQtyTap, incrementQtyTap;

  const CartCard(
      {super.key,
      required this.image,
      required this.name,
      required this.productQuantity,
      required this.totalPrice,
      required this.decrementQtyTap,
      required this.incrementQtyTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(image, width: 90, height: 90, fit: BoxFit.cover),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: decrementQtyTap,
                      icon: const Icon(Icons.remove_circle)),
                  SizedBox(
                      width: 20,
                      child: Text("$productQuantity",
                          textAlign: TextAlign.center)),
                  IconButton(
                      icon: const Icon(Icons.add_circle),
                      onPressed: incrementQtyTap),
                ],
              ),
            ],
          ),
          Expanded(
            child: Text("${totalPrice.toStringAsFixed(2)} L.E.",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.right),
          )
        ],
      ),
    );
  }
}
