import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_saling_test/blueprints/product_list_brain.dart';
import 'package:product_saling_test/components/categories.dart';
import 'package:product_saling_test/components/products_grid.dart';
import 'package:product_saling_test/constants.dart';
import 'package:show_up_animation/show_up_animation.dart';

class AllProductsPage extends StatefulWidget {
  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  ProductListBrain _productListBrain = ProductListBrain();
  List categoriesList = [];
  String categoryName = "Industrial";
  List categoryItems = [];

  // ignore: non_constant_identifier_names
  var selected_index = 0;

  @override
  void initState() {
    getCategories();
    getIndividualCategoryItems();
    super.initState();
  }

  // Gives the list of unique category
  void getCategories() async {
    var categoryList = await _productListBrain.getCategoryList();
    setState(() {
      categoriesList = categoryList;
    });
  }

  void getIndividualCategoryItems() async {
    var items = await _productListBrain.getCategoryItems(categoryName);
    setState(() {
      categoryItems = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController(initialPage: 0);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgLightColor,
        // appBar: AllProductsAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products",
                      style: kTitleText,
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 30,
                            ),
                            onPressed: () {}),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart_rounded,
                              size: 30,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
              categoryContainer(size, categoriesList),
              ProductGrid(size: size, categoryItems: categoryItems)
            ],
          ),
        ),
      ),
    );
  }

  Padding categoryContainer(Size size, List categories) {
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
                    categoryName = categoriesList[selected_index];
                    getIndividualCategoryItems();
                    // individualCategory();
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
