// ignore: file_names
import 'package:flutter/material.dart';
import 'package:meal_app/Screens/categoryMealScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  void selectCategory(BuildContext ctx, String id, String title) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealScreen(id, title);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context, id, title),
      splashColor: Colors.grey,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
            ),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.45), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
