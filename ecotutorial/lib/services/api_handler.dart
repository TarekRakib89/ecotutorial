import 'dart:convert';
import 'dart:developer';

import 'package:ecotutorial/const/api_const.dart';
import 'package:ecotutorial/models/product.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  Future<List<dynamic>> getData() async {
    try {
      var uri = Uri.https(
        BASE_URL,
        "api/v1/products",
      );

      var response = await http.get(uri);

      var data = jsonDecode(response.body);
      List productList = [];
      if (response.statusCode != 200) {
        throw data["message"];
      }
      for (var v in data) {
        productList.add(v);
        // print(productList[0]);
      }

      return productList;
    } catch (error) {
      log("An error occured $error");
      throw error.toString();
    }
  }

  Future<List<Products>> getAllProducts() async {
    List temp = await getData();

    return Products.productsFromSnapshot(temp);
  }

  // Future<List<Products>> getAllProductsByName({required name}) async {
  //   List temp = await getData();
  //   List productList = [];
  //   for (var element in temp) {
  //     final temp1 = temp[element]
  //         .firstWhere((element) => element["category"]["name"] == name);
  //     productList.add(temp1);
  //   }

  //   return Products.productsFromSnapshot(productList);
  // }
}
