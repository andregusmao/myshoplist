// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoplist_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoplistItemController on _ShoplistItemControllerBase, Store {
  final _$shoplistItemsAtom =
      Atom(name: '_ShoplistItemControllerBase.shoplistItems');

  @override
  Future<List<ShoplistItemModel>>? get shoplistItems {
    _$shoplistItemsAtom.reportRead();
    return super.shoplistItems;
  }

  @override
  set shoplistItems(Future<List<ShoplistItemModel>>? value) {
    _$shoplistItemsAtom.reportWrite(value, super.shoplistItems, () {
      super.shoplistItems = value;
    });
  }

  final _$listAsyncAction = AsyncAction('_ShoplistItemControllerBase.list');

  @override
  Future<List<ShoplistItemModel>> list() {
    return _$listAsyncAction.run(() => super.list());
  }

  @override
  String toString() {
    return '''
shoplistItems: ${shoplistItems}
    ''';
  }
}
