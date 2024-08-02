// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_18/Screens/checkout.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class productAndPrice extends StatelessWidget {
  const productAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);

    return Row(
      children: [
        Stack(
          children: [
            Positioned(
              bottom: 22,
              child: Container(
                child: Text(
                  '${carttt.selectedProducts.length}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(211, 164, 255, 193),
                    shape: BoxShape.circle),
              ),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckOut(),
                  ),
                );
              },
              icon: Icon(
                Icons.add_shopping_cart,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            '\$ ${carttt.price}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
