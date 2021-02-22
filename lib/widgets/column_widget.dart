import 'package:flutter/material.dart';

import '../models/categories.dart';

class ColumnWidget extends StatefulWidget {
  // Shoplist

  // Function that has BottomSheet
  @override
  _ColumnWidgetState createState() => _ColumnWidgetState();
}

class _ColumnWidgetState extends State<ColumnWidget> {
  List shopList = SHOPSLIST.map((num) => num).toList();
  

  void selectShop(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Container(
          child: ListView.separated(
            itemCount: shopList.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: (){
                 //print(fieldName);
                  _shopNumber(index);
                  
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      shopList[index].imageName,
                    ),
                  ),
                  title: Text(shopList[index].title),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        );
      },
    );
  }

  void _shopNumber(int num){
    setState(() {
      fieldName = shopList[num].title;
      shopColor = shopList[num].color;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Media query variable
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
        onTap: () {
          selectShop(context);
        },
          child: Container(
        decoration: BoxDecoration(
          color: shopColor,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(vertical: 20),
        height: mediaQuery.size.width * 0.1,
        width: mediaQuery.size.width * 0.3,
        
          child: Align(
            alignment: Alignment.center,
            child: Text(
              fieldName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              
            ),
          ),
          
          // child: Card(
          //   color: Colors.black87,
          //   child: ListTile(
          //     title: Text("Select Shop",
          //     style: TextStyle(color: Colors.white),
          //     )
          //   )
          // ),
        
      ),
    );
  }
}
