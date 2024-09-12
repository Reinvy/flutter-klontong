import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klontong/data/firebase/storage.dart';
import 'package:klontong/data/remote/category_remote_data.dart';
import 'package:klontong/data/remote/product_remote_data.dart';
import 'package:klontong/model/category.dart';

import '../model/product.dart';

enum ProductState { initial, loading, success, error }

class ProductProvider with ChangeNotifier {
  final ProductRemoteData _productRD;
  final CategoryRemoteData _categoryRD;
  final Storage _storage;
  ProductProvider(this._productRD, this._categoryRD, this._storage);

  ProductState _productState = ProductState.initial;
  ProductState get productState => _productState;
  set productState(ProductState state) {
    _productState = state;
    notifyListeners();
  }

  List<Product> _products = [];
  List<Product> _displayProducts = [];
  List<Product> get products => _products;
  List<Product> get displayProducts => _displayProducts;
  set displayProducts(List<Product> products) {
    _displayProducts = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      productState = ProductState.loading;
      _products = await _productRD.getProducts();
      displayProducts = _products;
      productState = ProductState.success;
    } catch (e) {
      debugPrint(e.toString());
      productState = ProductState.error;
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final categories = await _categoryRD.getCategories();
      return categories;
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
    required XFile image,
    required int harga,
  }) async {
    try {
      final imageUrl = await _storage.uploadImage(image);
      await _productRD.addProduct(
        category: category,
        name: name,
        description: description,
        sku: sku,
        weight: weight,
        width: width,
        length: length,
        height: height,
        image: imageUrl,
        harga: harga,
      );
      getProducts();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      displayProducts = _products;
    } else {
      displayProducts = _products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
