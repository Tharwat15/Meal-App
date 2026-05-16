import 'package:flutter/material.dart';
import 'package:meal_app/filterProvider.dart';

import 'package:meal_app/models/meals.dart';
import 'package:provider/provider.dart';
import '../dummy.dart';

class MealDetailScreen extends StatelessWidget {
  final String id;
  const MealDetailScreen(this.id);

  Widget buildContainer(
      {required BuildContext context, required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).height * 0.35,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    FiltersProvider provider = Provider.of<FiltersProvider>(context);
    provider.isMealFavourite(id);
    final Meal meal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
          title: FittedBox(fit: BoxFit.contain, child: Text(meal.title))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.35,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                "--Ingerdients--",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            buildContainer(
              context: context,
              child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Theme.of(context).canvasColor,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(meal.ingredients[index])),
                    );
                  }),
            ),
            SizedBox(
              child: Text(
                "--Steps--",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            buildContainer(
                context: context,
                child: ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text("# ${(index + 1).toString()}"),
                            ),
                            title: Text(
                              meal.steps[index],
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).canvasColor,
          child: Icon(
            provider.isMealFavourite(id) ? Icons.star : Icons.star_border,
          ),
          onPressed: () {
            provider.togglefavouites(id);
          }),
    );
  }
}
