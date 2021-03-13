import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'custom_product_cards.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: 20,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        itemBuilder: (context, index) {
          return CustomProductCards(size: size);
        },
        staggeredTileBuilder: (index) => StaggeredTile.count(1, 1.15),
      ),
    );
  }
}
