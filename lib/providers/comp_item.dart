import 'package:flutter/foundation.dart';

class CompItem {
  final String title;
  final String price;
  final String imageUrl;
  final String promo;

  CompItem(
    this.title,
    this.price,
    this.imageUrl,
    this.promo,
  );
}

class Comp with ChangeNotifier {
  List<CompItem> _items1 = [];
  List<CompItem> _items2 = [];

  // Fetches the comparisons items from first column
  List<CompItem> get compItems1 {
    // Returns a new list with items,
    return [..._items1];
  }

  // Fetches the comparisons items from second column
  List<CompItem> get compItems2 {
    // Returns a new list with items,
    return [..._items2];
  }

  // Functions that gets to the fist column
  void addCompItem1(String title, String price, String imageUrl, String promo) {
    // Add new compItem to list
    _items1.insert(
      0,
      CompItem(title, price, imageUrl, promo),
    );
    notifyListeners();
  }

  // Functions that gets to the second column
  void addCompItem2(String title, String price, String imageUrl, String promo) {
    // Add new compItem to list
    _items2.insert(
      0,
      CompItem(title, price, imageUrl, promo),
    );
    notifyListeners();
  }

  
}
