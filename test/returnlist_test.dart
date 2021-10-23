import 'dart:convert';

import 'package:flexittest/data/apicalls/getproductlist.dart';
import 'package:flexittest/domain/productmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  group("getProducts", () {
    test("returns list of products when succesful", () async {
      final client = MockClient((request) async {
        final mapJson =
            """"{[{"id":1,"title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price":109.95,"description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category":"men's clothing","image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating":{"rate":3.9,"count":120}},{"id":2,"title":"Mens Casual Premium Slim Fit T-Shirts ","price":22.3,"description":"Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.","category":"men's clothing","image":"https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg","rating":{"rate":4.1,"count":259}}}""";
        final response = jsonEncode(mapJson);
        return http.Response(response, 200);
      });

      final productList = await getProductList(client: client);
      expect(productList, isA<List<ProductModel>>());
    });
  });
}
