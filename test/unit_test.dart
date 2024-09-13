import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klontong/data/firebase/storage.dart';
import 'package:klontong/data/remote/category_remote_data.dart';
import 'package:klontong/data/remote/product_remote_data.dart';
import 'package:klontong/model/category.dart';
import 'package:klontong/model/product.dart';
import 'package:klontong/provider/product_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRemoteData extends Mock implements ProductRemoteData {}

class MockCategoryRemoteData extends Mock implements CategoryRemoteData {}

class MockStorage extends Mock implements Storage {
  @override
  Future<String> uploadImage(XFile? image) {
    return Future.value("test-image-url");
  }
}

final mockProductRD = MockProductRemoteData();
final mockCategoryRD = MockCategoryRemoteData();
final mockStorage = MockStorage();

void main() {
  group('ProductProvider Test', () {
    late ProductProvider provider;

    setUp(() {
      provider = ProductProvider(mockProductRD, mockCategoryRD, mockStorage);
    });

    test('getProducts - success', () async {
      // Mock successful data fetching
      when(() => mockProductRD.getProducts()).thenAnswer((_) => Future.value([
            Product(
              id: "test id",
              categoryId: "test category id",
              categoryName: "test category name",
              name: 'Test Product',
              description: 'Test description',
              sku: 'test-sku',
              weight: 10,
              width: 10,
              length: 10,
              height: 10,
              image: 'test-image',
              harga: 100,
            ),
          ]));

      await provider.getProducts();

      // Verify state changes and data update
      expect(provider.productState, ProductState.success);
      expect(provider.products.length, 1);
      expect(
        provider.displayProducts.length,
        greaterThan(
          0,
        ),
      );
    });

    test('getProducts - error', () async {
      // Mock error during fetching
      when(() => mockProductRD.getProducts()).thenThrow(Exception('Error'));

      await provider.getProducts();

      // Verify state changes
      expect(provider.productState, ProductState.error);
    });

    test('getCategories - success', () async {
      // Mock successful data fetching
      when(() => mockCategoryRD.getCategories())
          .thenAnswer((_) => Future.value([
                Category(
                  id: "test id",
                  name: "Test Category",
                ),
              ]));

      final categories = await provider.getCategories();

      // Verify state changes and data update
      expect(categories.length, greaterThan(0));
    });

    test('getCategories - error', () async {
      // Mock error during fetching
      when(() => mockCategoryRD.getCategories()).thenThrow(Exception('Error'));

      final categories = await provider.getCategories();

      // Verify state changes
      expect(categories, isEmpty);
    });

    test('addProduct - success', () async {
      // Mock successful data fetching
      when(() => mockProductRD.addProduct(
            category: Category(
              id: "test id",
              name: "Test Category",
            ),
            name: 'Test Product',
            description: 'Test description',
            sku: 'test-sku',
            weight: 10,
            width: 10,
            length: 10,
            height: 10,
            image: 'test-image-url',
            harga: 100,
          )).thenAnswer((_) => Future.value("success"));

      when(() => mockProductRD.getProducts()).thenAnswer((_) => Future.value([
            Product(
              id: "test id",
              categoryId: "test category id",
              categoryName: "test category name",
              name: 'Test Product',
              description: 'Test description',
              sku: 'test-sku',
              weight: 10,
              width: 10,
              length: 10,
              height: 10,
              image: 'test-image',
              harga: 100,
            ),
          ]));

      await provider.addProduct(
        category: Category(
          id: "test id",
          name: "Test Category",
        ),
        name: 'Test Product',
        description: 'Test description',
        sku: 'test-sku',
        weight: 10,
        width: 10,
        length: 10,
        height: 10,
        image: XFile.fromData(Uint8List.fromList([]), name: 'test-image'),
        harga: 100,
      );

      await provider.getProducts();

      // Verify state changes
      expect(provider.productState, ProductState.success);
    });
  });
}
