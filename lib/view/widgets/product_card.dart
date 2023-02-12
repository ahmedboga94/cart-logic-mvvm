import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image, name, description;
  final double price;
  final Function() addOnTap;

  const ProductCard(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.addOnTap,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(image, width: 90, height: 90, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name, style: const TextStyle(fontSize: 18)),
                  Text(description),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton.icon(
                          onPressed: addOnTap,
                          icon: const Icon(Icons.add),
                          label: const Text('Add')),
                      Text(
                        "$price L.E.",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
