import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:klontong/model/category.dart';
import 'package:klontong/util/constants.dart';

class CategoryRemoteData {
  final Dio _dio;
  CategoryRemoteData(this._dio);

  Future<List<Category>> getCategories() async {
    try {
      Response response = await _dio.get(
        "$baseUrl/category",
      );
      List<Category> categories = categoryFromJson(
        jsonEncode(response.data),
      );
      return categories;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
