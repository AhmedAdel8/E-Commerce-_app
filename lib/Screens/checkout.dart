// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_18/Constants.dart';
import 'package:flutter_application_18/provider/cart.dart';
import 'package:flutter_application_18/widgets/appbar.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change color on your need
        ),
        actions: [
          productAndPrice(),
        ],
        backgroundColor: KappbarGreen,
        title: Text(
          'Checkout screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 600,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: carttt.selectedProducts.length,
                  //itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(carttt.selectedProducts[index].name),
                        subtitle: Text(
                            "${carttt.selectedProducts[index].price} - ${carttt.selectedProducts[index].location}"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              carttt.selectedProducts[index].imgPath),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            carttt.delete(carttt.selectedProducts[index]);
                          },
                          icon: Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Pay \$${carttt.price}',
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(KBTNpink),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
            ),
          ),
        ],
      ),
    );
  }
}
