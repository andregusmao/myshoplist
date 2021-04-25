// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketplaceController on _MarketplaceControllerBase, Store {
  final _$marketplacesAtom =
      Atom(name: '_MarketplaceControllerBase.marketplaces');

  @override
  Future<List<MarketplaceModel>>? get marketplaces {
    _$marketplacesAtom.reportRead();
    return super.marketplaces;
  }

  @override
  set marketplaces(Future<List<MarketplaceModel>>? value) {
    _$marketplacesAtom.reportWrite(value, super.marketplaces, () {
      super.marketplaces = value;
    });
  }

  final _$listAsyncAction = AsyncAction('_MarketplaceControllerBase.list');

  @override
  Future<List<MarketplaceModel>> list() {
    return _$listAsyncAction.run(() => super.list());
  }

  final _$loadAsyncAction = AsyncAction('_MarketplaceControllerBase.load');

  @override
  Future<MarketplaceModel> load(int id) {
    return _$loadAsyncAction.run(() => super.load(id));
  }

  final _$saveAsyncAction = AsyncAction('_MarketplaceControllerBase.save');

  @override
  Future<int?> save(MarketplaceModel marketplaceModel) {
    return _$saveAsyncAction.run(() => super.save(marketplaceModel));
  }

  final _$deleteAsyncAction = AsyncAction('_MarketplaceControllerBase.delete');

  @override
  Future<int?> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
marketplaces: ${marketplaces}
    ''';
  }
}
