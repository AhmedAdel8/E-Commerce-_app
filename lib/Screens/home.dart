// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_18/Constants.dart';
import 'package:flutter_application_18/Screens/checkout.dart';
import 'package:flutter_application_18/Screens/details_screen.dart';
import 'package:flutter_application_18/Screens/login.dart';
import 'package:flutter_application_18/models/item.dart';
import 'package:flutter_application_18/provider/cart.dart';
import 'package:flutter_application_18/widgets/appbar.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/1.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  accountName: Text(
                    'Ahmed Adel',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  accountEmail: Text('ahmed@yahoo.com'),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/16.jpeg'),
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('My products'),
                  leading: Icon(Icons.add_shopping_cart),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOut(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('About'),
                  leading: Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text(
                'Developed by Ahmed Adel',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change color on your need
        ),
        actions: [
          productAndPrice(),
        ],
        backgroundColor: KappbarGreen,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 33),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      product: items[index],
                    ),
                  ),
                );
              },
              child: GridTile(
                child: Stack(
                  children: [
                    Positioned(
                      top: -3,
                      bottom: -9,
                      right: 0,
                      left: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.asset(
                          items[index].imgPath,
                        ),
                      ),
                    ),
                  ],
                ),
                footer: GridTileBar(
                  trailing: IconButton(
                    color: Color.fromARGB(255, 62, 94, 70),
                    onPressed: () {
                      carttt.add(items[index]);
                    },
                    icon: Icon(Icons.add),
                  ),
                  leading: Text('\$12.99'),
                  title: Text(
                    "",
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
