// ignore_for_file: avoid_print

import 'package:simplecode_test1/repo/api.dart';

import '../screens/models/products.dart';

import 'package:simplecode_test1/generated/l10n.dart';

class RepoProducts {
  RepoProducts({required this.api});

  final Api api;

  Future<ResultRepoProducts> fetchProducts(String? title) async {
    try {
      final result = await api.dio.get('/products');

      final productsListJson = result.data as List;

      final productsList = productsListJson
          .map(
            (item) => Products.fromJson(item),
          )
          .toList();

      return ResultRepoProducts(productsList: productsList);
    } catch (error) {
      print('Error: $error');
      return ResultRepoProducts(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }

  Future<ResultRepoProducts> sortProducts(String? id) async {
    try {
      print(id);
      final result = await api.dio.get('/products?sort=$id');

      final List productsListJson = result.data as List;
      final productsList = productsListJson
          .map(
            (item) => Products.fromJson(item),
          )
          .toList();

      return ResultRepoProducts(productsList: productsList);
    } catch (error) {
      print('Error: $error');
      return ResultRepoProducts(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }

  Future<ResultRepoProducts> filterCategory(String? category) async {
    try {
      final result = await api.dio.get('/products/category/$category');
      print(category);
      final List productsListJson = result.data as List;
      final productsList = productsListJson
          .map(
            (item) => Products.fromJson(item),
          )
          .toList();

      return ResultRepoProducts(productsList: productsList);
    } catch (error) {
      print('Error: $error');
      return ResultRepoProducts(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }

  Future<ResultRepoProducts> filterRating(num? rating) async {
    try {
      final result = await api.dio.get('/products');

      final productsListJson = result.data as List;

      final productsList = productsListJson
          .map(
            (item) => Products.fromJson(item),
          )
          .toList();
      if (rating == 0) {
        return ResultRepoProducts(productsList: productsList);
      }
      final newList = productsList
          .where(
            (element) =>
                ((element.rating?.rate ?? 0.0) >= (rating ?? 0.0) - 0.5) &&
                ((element.rating?.rate ?? 0.0) < (rating ?? 0.0) + 0.5),
          )
          .toList();
      return ResultRepoProducts(productsList: newList);
    } catch (error) {
      print('Error: $error');
      return ResultRepoProducts(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }
}

class ResultRepoProducts {
  ResultRepoProducts({
    this.errorMessage,
    this.productsList,
  });

  final String? errorMessage;
  final List<Products>? productsList;
}
