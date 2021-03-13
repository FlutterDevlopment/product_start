import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_saling_test/components/categories.dart';
import 'package:product_saling_test/components/product_page_banner.dart';
import 'package:product_saling_test/components/products_grid.dart';
import 'package:product_saling_test/constants.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List categories = [
    "Electronics",
    "Baby",
    "Sports",
    "Watch",
    "Jewels",
    "City"
  ];
  // ignore: non_constant_identifier_names
  var selected_index = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFBF1EE),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFFFBF1EE),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: kTextColor,
                  ),
                  onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  icon: Icon(
                    Icons.shopping_bag_rounded,
                    color: kTextColor,
                  ),
                  onPressed: () {}),
            ),
          ],
          title: Text(
            "Products",
            style: kTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductPageBanner(size: size),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding, vertical: kVerticalPadding),
                child: Text(
                  "Categories",
                  style: kTextStyle.copyWith(fontSize: 24),
                ),
              ),
              categoryContainer(size),
              ProductGrid(size: size),
            ],
          ),
        ),
      ),
    );
  }

  Padding categoryContainer(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: kVerticalPadding),
      child: Container(
        height: size.height * 0.08,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: kHorizontalPadding),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected_index = index;
                  });
                },
                child: Categories(
                    categories: categories,
                    index: index,
                    selected_index: selected_index),
              ),
            );
          },
        ),
      ),
    );
  }
}
