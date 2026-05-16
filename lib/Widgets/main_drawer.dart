import 'package:flutter/material.dart';
import '../Screens/filterSceen.dart';
import '../Screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer();

  Widget buildlisttitle(
      {required BuildContext ctx,
      required String title,
      required IconData icon,
      required Function tabHandler}) {
    return Column(children: [
      const SizedBox(
        height: 10,
      ),
      ListTile(
        onTap: () => tabHandler(),
        leading: CircleAvatar(
          backgroundColor: Theme.of(ctx).primaryColor,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(children: [
        Container(
          color: Theme.of(context).primaryColor.withAlpha(200),
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text("Cokking up...",
              style: Theme.of(context).appBarTheme.titleTextStyle),
        ),
        buildlisttitle(
            ctx: context,
            title: "Meals",
            icon: Icons.restaurant,
            tabHandler: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return TabsScreen();
              }));
            }),
        buildlisttitle(
            ctx: context,
            title: "Filters",
            icon: Icons.settings,
            tabHandler: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const FilterScreen();
              }));
            }),
      ]),
    );
  }
}
