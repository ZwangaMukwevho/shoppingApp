import 'package:flutter/material.dart';
import 'package:shop_app/widgets/column_widget.dart';
import 'package:provider/provider.dart';

import '../providers/searchWord.dart';
import '../screens/SearchProduct.dart';

class CompSplitView extends StatefulWidget {
  @override
  _CompSplitViewState createState() => _CompSplitViewState();
}

class _CompSplitViewState extends State<CompSplitView> {
  // Container that'll hold an individual product
  Widget productTile(String name, String price, String promo) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          //borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'Assets/images/Woolworths.jpg',
              height: 80,
              width: 50,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      promo,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      price,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              height: 80,
              width: 100,
            )
          ],
        ),
      );

  // Alternative widget to hold the product
  Widget productTile1(String name, String price, String promo) => Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          // Elevation adds shodow behign the card
          elevation: 8,
          margin: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      'Assets/images/Woolworths.jpg',
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Align(
                          //alignment: Alignment.centerLeft,
                          child: Text(
                            promo,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Align(
                          //alignment: Alignment.bottomLeft,
                          child: Text(
                            price,
                            overflow: TextOverflow.ellipsis,
                            //style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    // Media query variable
    final mediaQuery = MediaQuery.of(context);
    final searchWords = Provider.of<SearchWord>(context);
    searchWords.fetchAndSetWords();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        // Will include individual columns as children that will hold products
        children: [
          // Left hand side of split view
          Column(
            children: <Widget>[
              // Container that will hold the shop name
              ColumnWidget(),

              // Container that'll hold an individual product
              productTile1('Woolworths', '2 for 1', 'R35.99'),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: Search());
                    },
                    icon: Icon(Icons.add_circle),
                  ),
                  // child: FloatingActionButton(
                  //   onPressed: () {
                  //     Navigator.of(context).pushNamed(ProductsOverviewScreen.routeName);
                  //   },
                  //   child: Icon(Icons.add),
                  // ),
                ),
              )
            ],
          ),

          // Right hand side of split view
          Column(children: [
            // Container that will hold the shop name
            ColumnWidget(),

            // Container that'll hold an individual product
            productTile1('Woolies', '2 for 1', 'R35'),
          ])
        ],
      ),
    );
  }
}
