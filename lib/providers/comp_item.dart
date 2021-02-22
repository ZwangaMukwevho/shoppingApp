import 'package:flutter/foundation.dart';

import '../providers/product.dart';

class CompItem {
  
}

class Comp with ChangeNotifier {
  List<Product> _items1 = [];
  List<Product> _items2 = [];

  // Fetches the comparisons items from first column
  List<Product> get compItems1 {
    // Returns a new list with items,
    return [..._items1];
  }

  // Fetches the comparisons items from second column
  List<Product> get compItems2 {
    // Returns a new list with items,
    return [..._items2];
  }

  // Functions that gets to the fist column
  void addCompItem1(Product product1) {
    // Add new compItem to list
    _items1.add(
    
      product1,
    );
    notifyListeners();
  }

  // Functions that gets to the second column
  void addCompItem2(Product product2) {
    // Add new compItem to list
    _items2.add(
     product2,
    );
    notifyListeners();
  }

  
}
