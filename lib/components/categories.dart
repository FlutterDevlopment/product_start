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
        child: Text(
          "${categories[index]}",
          style: kTextStyle.copyWith(
              fontSize: 17.3,
              color: selected_index == index ? Color(0xFFff1616) : Colors.grey),
        ),
      ),
    );
  }
}
