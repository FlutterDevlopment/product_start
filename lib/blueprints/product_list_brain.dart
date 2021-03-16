import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductListBrain {
  List listProducts = [];
  // ignore: non_constant_identifier_names, missing_return
  Future<List> getProductsData() async {
    var url = Uri.http('6037c52d54350400177235f5.mockapi.io', '/product');
    var response = await http.get(url);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      var productLists = convert.jsonDecode(data);
      return productLists;
    }
  }

  Future<List> getCategoryList() async {
    List categoriesList = [];
    var productLists = await getProductsData();
    for (var product in productLists) {
      var category = product["productCategory"];
      if (!categoriesList.contains(category)) categoriesList.add(category);
    }
    return categoriesList;
  }

  Future<List> getCategoryItems(category) async {
    List categoryItems = [];
    var productLists = await getProductsData();
    for (var product in productLists) {
      if (product["productCategory"] == category) categoryItems.add(product);
    }
    return categoryItems;
  }
}
