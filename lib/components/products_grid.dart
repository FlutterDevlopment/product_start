import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'custom_product_cards.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key key,
    @required this.size,
    this.categoryItems,
  }) : super(key: key);

  final Size size;
  final categoryItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        children: List.generate(
          categoryItems.length,
          (index) {
            return CustomProductCards(
              size: size,
              categoryItems: categoryItems,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
