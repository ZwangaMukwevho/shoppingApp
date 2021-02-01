import 'package:flutter/material.dart';
import 'package:shop_app/widgets/column_widget.dart';


class CompSplitView extends StatefulWidget {

  
  @override
  _CompSplitViewState createState() => _CompSplitViewState();
}

class _CompSplitViewState extends State<CompSplitView> {
  @override
  Widget build(BuildContext context) {

    // Media query variable
    final mediaQuery = MediaQuery.of(context);

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
              ],
          ),

          // Right hand side of split view
          Column(
            children: [
              // Container that will hold the shop name
              ColumnWidget(),
              
            ]
          )
        ],
      ),
    );
  }
}
