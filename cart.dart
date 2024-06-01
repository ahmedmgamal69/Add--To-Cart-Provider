import 'package:flutter/material.dart';
import 'package:flutterproject/model/item.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _price = 0.0;

  void add(Item item) {
    _items.add(item);
    _price += item.itemPrice!;
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    _price -= item.itemPrice!;
    notifyListeners();
  }

  List<Item> get itemsBasket {
    return _items;
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _price;
  }

  get cartCount => count;
}
