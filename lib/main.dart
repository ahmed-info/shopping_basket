import 'package:flutter/material.dart';
import 'package:shopping_basket/home.dart';
import 'package:shopping_basket/model/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping basket",
        home: Home(),
      ),
    );
  }
}
