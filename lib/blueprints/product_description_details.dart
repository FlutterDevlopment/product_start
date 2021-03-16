class ProductDescriptions {
  List<Map<String, String>> getDescription(product, dateFormatted) {
    final List<Map<String, String>> listOfProductsDetails = [
      {"Name": "Brand", "Description": product["productBrand"]},
      {"Name": "Category", "Description": product["productCategory"]},
      {"Name": "Colour", "Description": product["productColor"]},
      {"Name": "Material", "Description": product["productMaterial"]},
      {"Name": "Availability", "Description": product["productAvailability"]},
      {"Name": "Launch Date", "Description": dateFormatted},
    ];

    return listOfProductsDetails;
  }
}
