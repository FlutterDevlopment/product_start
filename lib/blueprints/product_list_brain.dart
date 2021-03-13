import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductListBrain {
  ProductListBrain() {
    calling_api();
  }
  // ignore: non_constant_identifier_names, missing_return
  Future<void> calling_api() async {
    var url = Uri.http('6037c52d54350400177235f5.mockapi.io', '/product');
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      List listProducts = convert.jsonDecode(data);
      print(listProducts);
    }
  }
}
