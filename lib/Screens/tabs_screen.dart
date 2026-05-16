import 'package:flutter/material.dart';
import 'package:meal_app/filterProvider.dart';
import 'package:provider/provider.dart';
import '../Screens/categoryScreen.dart';
import '../Screens/favorite_screen.dart';
import '../Widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen();

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final FiltersProvider provider = Provider.of<FiltersProvider>(context);
    final List<Map<String, Object>> pages = [
      {"page": CategoriesScreen(), 'title': "Categories"},
      {"page": FavoritesScreen(provider.favouriteMeals), 'title': "Favorites"},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: "Category"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.favorite),
              label: "Favoite"),
        ],
      ),
    );

    //------------top tabs--------------------------------------
    // DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //           title: const Text("Hummy Yummy"),
    //           bottom: TabBar(
    //               splashBorderRadius: BorderRadius.circular(80),
    //               indicatorColor: Colors.white,
    //               indicatorPadding: const EdgeInsets.all(5),
    //               labelColor: Colors.white,
    //               tabs: [
    //                 Tab(
    //                   icon: const Icon(Icons.category),
    //                   text: "Category",
    //                 ),
    //                 Tab(
    //                   icon: const Icon(Icons.favorite),
    //                   text: "Favoite",
    //                 )
    //               ])),
    //       body: TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
    //     ));
  }
}
