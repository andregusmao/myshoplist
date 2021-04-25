import 'package:myshoplist/models/shoplist_item_model.dart';

abstract class IShoplistItemRepository {
  Future<List<ShoplistItemModel>> getAll(int shoplistId);
  Future<int> getCount(int shoplistId);
  Future<ShoplistItemModel> getById(int id);
  Future<int?> insert(ShoplistItemModel shoplistItemModel);
  Future<int?> update(ShoplistItemModel shoplistItemModel);
  Future<int?> delete(int id);
}
