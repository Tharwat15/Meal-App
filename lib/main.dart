import 'package:flutter/material.dart';
import 'package:meal_app/Screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:meal_app/filterProvider.dart';

void main() => runApp(
      ChangeNotifierProvider<FiltersProvider>(
        // Wrap with provider
        create: (_) =>
            FiltersProvider(), // Create a new FiltersProvider instance
        child: const MyApp(), // Your app's root widget
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

void setState(Null Function() param0) {}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hummy Yummy',
      theme: ThemeData(
          primaryColor: Colors.teal,
          canvasColor: Colors.yellow,
          fontFamily: "Raleway",
          scaffoldBackgroundColor: const Color(0xfff8eabd),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.teal,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontFamily: "RobotoCondensed",
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
      // A widget which will be started on application startup
      home: TabsScreen(),
    );
  }
}
