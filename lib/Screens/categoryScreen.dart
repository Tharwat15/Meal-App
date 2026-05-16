import 'package:flutter/material.dart';
import '../Widgets/Category_item.dart';
import '../dummy.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Hummy Yummy",
      //   ),
      // ),
      // backgroundColor: Colors.,
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GridView(
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //mian axis or cors axis acoring to the scrolling diriction
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES.map((catdata) {
            return CategoryItem(
              catdata.id,
              catdata.title,
              catdata.color,
            );
          }).toList(),
        ),
      ),
    );
  }
}
