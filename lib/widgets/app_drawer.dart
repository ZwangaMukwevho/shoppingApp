import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';
import '../screens/shops_screen.dart';
import '../screens/comparison_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),

          // Shops option
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shops'),
            onTap: () {
              Navigator.of(context)
                   .pushReplacementNamed(ShopsScreen.routeName);
            },),

          // Categories option
           Divider(),
          ListTile(
            leading: Icon(Icons.outlined_flag),
            title: Text('Compare prices'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ComparisonScreen.routeName);
            },
          ),  
          
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),  

          // Creating Icon for logging out
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
               Navigator.of(context).pop();
              Provider.of<Auth>(context, listen: false).logout();
            },)
        ],
      ),
    );
  }
} 