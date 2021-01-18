import 'package:flutter/material.dart';

//mport '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageUrl;

  CategoryItem(this.id, this.title, this.color, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            backgroundColor:Colors.black54,   
          ),
          softWrap: true,
          overflow: TextOverflow.fade,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          // gradient: LinearGradient(
          //   colors: [
          //     color.withOpacity(0.7),
          //     color,
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
      ),
    );
  }
}
