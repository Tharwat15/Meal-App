import 'package:flutter/material.dart';
import 'dummy.dart';
import './models/meals.dart';

class FiltersProvider extends ChangeNotifier {
  Map<String, bool> _currentFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> avaialbleMeals = DUMMY_MEALS;

  List<Meal> favouriteMeals = [];

  Map<String, bool> get filters => _currentFilters;

  bool isMealFavourite(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }

  void togglefavouites(mealId) {
    final existingindex =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingindex >= 0) {
      favouriteMeals.removeAt(existingindex);
    } else {
      favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
    notifyListeners();
  }

  void updateFilters(Map<String, bool> newFilters) {
    _currentFilters.addAll(newFilters); // Update all filters

    avaialbleMeals = DUMMY_MEALS.where((meal) {
      if (_currentFilters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (_currentFilters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (_currentFilters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (_currentFilters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners(); // Notify listeners about the change
  }
}
