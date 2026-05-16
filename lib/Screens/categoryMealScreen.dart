import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:provider/provider.dart';
import '../Widgets/meal_iteam.dart';
import '../filterProvider.dart';

class CategoryMealScreen extends StatefulWidget {
  final String id;
  final String categoryTitle;

  CategoryMealScreen(this.id, this.categoryTitle);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late List<Meal> displayedMels;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<FiltersProvider>(context, listen: false);
    displayedMels = provider.avaialbleMeals
        .where((meal) => meal.categories.contains(widget.id))
        .toList();
  }

  void removeitem(String id) {
    setState(() {
      displayedMels.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.categoryTitle)),
        body: ListView.builder(
          itemCount: displayedMels.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              displayedMels[index].id,
              displayedMels[index].title,
              displayedMels[index].imageUrl,
              displayedMels[index].duration,
              displayedMels[index].complexity,
              displayedMels[index].affordability,
              // removeitem
            );
          },
        ));
  }
}
