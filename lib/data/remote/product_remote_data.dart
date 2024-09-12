import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:klontong/model/product.dart';
import 'package:klontong/util/constants.dart';

class ProductRemoteData {
  final Dio _dio;
  ProductRemoteData(this._dio);

  Future<List<Product>> getProducts() async {
    try {
      Response response = await _dio.get(
        "$baseUrl/product",
      );
      List<Product> products = productFromJson(
        jsonEncode(response.data),
      );
      return products;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
