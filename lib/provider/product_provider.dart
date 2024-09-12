import 'package:flutter/material.dart';
import 'package:klontong/data/remote/category_remote_data.dart';
import 'package:klontong/data/remote/product_remote_data.dart';
import 'package:klontong/model/category.dart';

import '../model/product.dart';

enum ProductState { initial, loading, success, error }

class ProductProvider with ChangeNotifier {
  final ProductRemoteData _productRD;
  final CategoryRemoteData _categoryRD;
  ProductProvider(this._productRD, this._categoryRD);

  ProductState _productState = ProductState.initial;
  ProductState get productState => _productState;
  set productState(ProductState state) {
    _productState = state;
    notifyListeners();
  }

  List<Product> _products = [];
  List<Product> displayProducts = [];

  List<Category> _categories = [];
  List<Category> get categories => _categories;
  set categories(List<Category> categories) {
    _categories = categories;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      productState = ProductState.loading;
      categories = await _categoryRD.getCategories();
      _products = await _productRD.getProducts();
      displayProducts = _products;
      productState = ProductState.success;
    } catch (e) {
      productState = ProductState.error;
    }
  }
}
