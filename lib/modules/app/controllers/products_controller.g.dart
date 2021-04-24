// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsController on _ProductsControllerBase, Store {
  final _$productsAtom = Atom(name: '_ProductsControllerBase.products');

  @override
  Future<List<ProductModel>>? get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(Future<List<ProductModel>>? value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$listAsyncAction = AsyncAction('_ProductsControllerBase.list');

  @override
  Future<List<ProductModel>> list() {
    return _$listAsyncAction.run(() => super.list());
  }

  final _$loadAsyncAction = AsyncAction('_ProductsControllerBase.load');

  @override
  Future<ProductModel> load(int id) {
    return _$loadAsyncAction.run(() => super.load(id));
  }

  final _$saveAsyncAction = AsyncAction('_ProductsControllerBase.save');

  @override
  Future<int?> save(ProductModel productModel) {
    return _$saveAsyncAction.run(() => super.save(productModel));
  }

  final _$deleteAsyncAction = AsyncAction('_ProductsControllerBase.delete');

  @override
  Future<int?> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
