import 'package:flutter/material.dart';

import '../providers/products.dart';

class ProductDetail extends StatelessWidget {
  final String imageUrl;

  ProductDetail(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        // Adds a bit of shadow on the card
        elevation: 4,

        // Adds space margin around the card
        margin: EdgeInsets.all(10),

        // Columns allows multiple widgets to be on top of each other
        child: Column(
          children: <Widget>[
            // Stack allows the image to have rounded corners
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                      imageUrl,
                      height:250,
                      width: double.infinity,
                      fit: BoxFit.cover),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
