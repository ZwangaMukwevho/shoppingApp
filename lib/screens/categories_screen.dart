import 'package:flutter/material.dart';

import '../providers/categories.dart';
import '../widgets/category_item.dart';
import "../widgets/app_drawer.dart";

class CategoriesScreen extends StatelessWidget {

   static const routeName = '/Categories-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price-Comp'),
      ),

      // Adding drawer icon to screen
      drawer: AppDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                    catData.id,
                    catData.title,
                    catData.color,
                    catData.imageUrl,
                  ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
