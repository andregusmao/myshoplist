// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoplist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoplistController on _ShoplistControllerBase, Store {
  final _$shopslistsAtom = Atom(name: '_ShoplistControllerBase.shopslists');

  @override
  Future<List<ShoplistModel>>? get shopslists {
    _$shopslistsAtom.reportRead();
    return super.shopslists;
  }

  @override
  set shopslists(Future<List<ShoplistModel>>? value) {
    _$shopslistsAtom.reportWrite(value, super.shopslists, () {
      super.shopslists = value;
    });
  }

  final _$listAsyncAction = AsyncAction('_ShoplistControllerBase.list');

  @override
  Future<List<ShoplistModel>> list() {
    return _$listAsyncAction.run(() => super.list());
  }

  final _$loadAsyncAction = AsyncAction('_ShoplistControllerBase.load');

  @override
  Future<ShoplistModel> load(int id) {
    return _$loadAsyncAction.run(() => super.load(id));
  }

  final _$saveAsyncAction = AsyncAction('_ShoplistControllerBase.save');

  @override
  Future<int?> save(ShoplistModel shoplistModel) {
    return _$saveAsyncAction.run(() => super.save(shoplistModel));
  }

  final _$updateAsyncAction = AsyncAction('_ShoplistControllerBase.update');

  @override
  Future<int?> update(ShoplistModel shoplistModel) {
    return _$updateAsyncAction.run(() => super.update(shoplistModel));
  }

  final _$deleteAsyncAction = AsyncAction('_ShoplistControllerBase.delete');

  @override
  Future<int?> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
shopslists: ${shopslists}
    ''';
  }
}
