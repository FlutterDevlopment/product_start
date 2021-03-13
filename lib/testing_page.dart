import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:product_saling_test/blueprints/product_list_brain.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var product = ProductListBrain();
  @override
  void initState() {
    super.initState();
  }

  // ignore: non_constant_identifier_names
  Future<void> calling_api() async {
    var url = Uri.http('6037c52d54350400177235f5.mockapi.io', '/product');
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      var listProducts = convert.jsonDecode(data);
      print(listProducts[0]);
      List category = [];
      for (var products in listProducts) {
        // if (!category.contains(products['productCategory']))
        if (products["productCategory"] == "Books") {
          print(products['productCategory']);
          category.add(products['productCategory']);
        }
      }
      print(category.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
