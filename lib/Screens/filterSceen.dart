import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../filterProvider.dart';
import '/Widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen();

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Map<String, bool> filters;
  late FiltersProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<FiltersProvider>(context, listen: false);
    filters = provider.filters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                provider.updateFilters(filters);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text("Adjust your meal selection"),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  title: const Text("Gluten Free"),
                  subtitle: Text(
                    "Only include gluten-free meals",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  value: filters['gluten'] ?? false,
                  onChanged: (newValue) {
                    setState(() {
                      filters['gluten'] = newValue;
                    });
                  }),
              SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  title: const Text("Lactose Free"),
                  subtitle: Text(
                    "Only include lactose-free meals",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  value: filters['lactose'] ?? false,
                  onChanged: (newValue) {
                    setState(() {
                      filters['lactose'] = newValue;
                    });
                  }),
              SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  title: const Text("Vegan"),
                  subtitle: Text(
                    "Only include vegan meals",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  value: filters['vegan'] ?? false,
                  onChanged: (newValue) {
                    setState(() {
                      filters['vegan'] = newValue;
                    });
                  }),
              SwitchListTile(
                  activeColor: Theme.of(context).primaryColor,
                  title: const Text("Vegetarian"),
                  subtitle: Text(
                    "Only include vegetarian meals",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  value: filters['vegetarian'] ?? false,
                  onChanged: (newValue) {
                    setState(() {
                      filters['vegetarian'] = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
