import 'package:flutter/material.dart';
import '../Screens/meal_details_screen.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeitem;

  const MealItem(
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
    // this.removeitem
  );

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return MealDetailScreen(id);
    })).then((value) {
      if (value != null) {
        // removeitem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).canvasColor,
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    height: 250,
                    width: double.infinity,
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 20,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      width: 250,
                      color: Colors.white54,
                      child: Text(
                        title,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      Text(
                        '$duration min',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      Text(complexity.name,
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      Text(affordability.name,
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
