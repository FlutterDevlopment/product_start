import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_saling_test/blueprints/product_description_details.dart';
import 'package:product_saling_test/pages/description_page.dart';

class DescriptionDataTable extends StatelessWidget {
  const DescriptionDataTable({
    Key key,
    @required this.productDescriptions,
    @required this.widget,
    @required this.dateFormatted,
  }) : super(key: key);

  final ProductDescriptions productDescriptions;
  final DescriptionPage widget;
  final String dateFormatted;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowHeight: 0,
      columns: [
        DataColumn(
          label: Text(''),
        ),
        DataColumn(
          label: Text(''),
        ),
      ],
      rows: productDescriptions
          .getDescription(widget.product, dateFormatted)
          .map((element) => DataRow(cells: [
                DataCell(Text(
                  element["Name"],
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 18,
                      color: Color(0xFF38383A)),
                )),
                DataCell(Text(
                  element["Description"],
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ]))
          .toList(),
    );
  }
}
