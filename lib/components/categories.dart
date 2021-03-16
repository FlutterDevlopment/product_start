import 'package:flutter/material.dart';

import '../constants.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
    @required this.categories,
    this.index,
    // ignore: non_constant_identifier_names
    this.selected_index,
  }) : super(key: key);

  final List categories;
  final index;
  // ignore: non_constant_identifier_names
  final selected_index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 26),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${categories[index]}",
              style: kTextStyle.copyWith(
                  fontSize: 20,
                  color:
                      selected_index == index ? Colors.black87 : Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color:
                  selected_index == index ? Colors.black87 : Colors.transparent,
              height: 3,
              width: 45,
            )
          ],
        ),
      ),
    );
  }
}
