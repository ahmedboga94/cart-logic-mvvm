import 'package:flutter/material.dart';
import 'package:sumtotal/view/product_view.dart';
import 'viewModel/cart_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CartViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food List",
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        appBarTheme: const AppBarTheme(color: Colors.indigo),
      ),
      themeMode: ThemeMode.dark,
      home: ProductView(),
    );
  }
}
