import 'package:dio/dio.dart';

class Api {
  final options = BaseOptions(
    baseUrl: 'https://fakestoreapi.com',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  late final dio = Dio(options)..interceptors.addAll([_BasicInterceptor()]);

  // static Future<List<Products>> fetchProducts() async {
  //   Response response = await Dio().get('https://fakestoreapi.com/products');
  //   return (response.data as List).map((x) => Products.fromJson(x)).toList();
  // }
}

class _BasicInterceptor implements Interceptor {
  @override
  void onError(
    DioError error,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
