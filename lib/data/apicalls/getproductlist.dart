import 'dart:convert';
import 'package:flexittest/domain/productmodel.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> getProductList({http.Client client}) async {
  try {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products/"));
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      List<ProductModel> productList =
          (jsonBody as List).map((i) => ProductModel.fromJson(i)).toList();
      return productList;
    } else {
      throw "Failed to load products";
    }
  } catch (error) {
    throw error;
  }
}
