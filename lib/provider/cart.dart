import 'package:flutter/material.dart';
import 'package:flutter_application_18/models/item.dart';

class Cart with ChangeNotifier {
  List selectedProducts = [];

  int price = 0;

  add(Item product) {
    // method     Class داخل ال
    selectedProducts.add(product);
    price += product.price.round();
    notifyListeners();

    ///     refresh كانه بيعمل ال
  }

  delete(Item product) {
    // method     Class داخل ال
    selectedProducts.remove(product);
    price -= product.price.round();
    notifyListeners();

    ///     refresh كانه بيعمل ال
  }
}
