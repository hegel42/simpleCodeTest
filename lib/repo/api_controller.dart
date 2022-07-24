// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:simplecode_test1/screens/models/products.dart';

class ApiControl {
  var dio = Dio();

  static Future<List<Products>> fetchArticle() async {
    Response response = await Dio().get('https://fakestoreapi.com/products');
    return (response.data as List).map((x) => Products.fromJson(x)).toList();
  }

  static Future<List<Products>> fetchArticleByCategorie(
      String categoryName) async {
    Response response = await Dio()
        .get('https://fakestoreapi.com/products/category/$categoryName');
    return (response.data as List).map((x) => Products.fromJson(x)).toList();
  }

  static Future<Products> fetchArticleByID(int aricleID) async {
    Response response =
        await Dio().get('https://fakestoreapi.com/products/$aricleID');
    Products _article = Products.fromJson(response.data);
    return _article;
  }
}
