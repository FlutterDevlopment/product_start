import 'package:flutter/material.dart';
import 'package:product_saling_test/pages/all_products_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Mon",
      ),
      home: AllProductsPage(),
    );
  }
}
