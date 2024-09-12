import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:klontong/model/product.dart';
import 'package:klontong/util/constants.dart';

import '../../model/category.dart';

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

  Future<void> addProduct({
    required Category category,
    required String name,
    required String description,
    required String sku,
    required int weight,
    required int width,
    required int length,
    required int height,
    required String image,
    required int harga,
  }) async {
    try {
      final data = {
        "categoryId": category.id,
        "categoryName": category.name,
        "sku": sku,
        "name": name,
        "description": description,
        "weight": weight,
        "width": width,
        "length": length,
        "height": height,
        "image": image,
        "harga": harga,
      };
      await _dio.post(
        "$baseUrl/product",
        data: data,
      );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
