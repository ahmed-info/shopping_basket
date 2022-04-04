import 'package:flutter/material.dart';
import 'package:shopping_basket/model/item.dart';

class Cart with ChangeNotifier {
  final List<Item> _items = [];
  double _price = 0.0;
  void aadd(Item item) {
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }

  void removee(Item item) {
    _items.remove(item);
    _price -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _price;
  }

  List<Item> get basketItem {
    return _items;
  }
}
