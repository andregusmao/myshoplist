import 'package:myshoplist/app/modules/home/models/shoplist_item_model.dart';

abstract class IShoplistItemRepository {
  Future<List<ShoplistItemModel>> getAll();
  Future<int> getCount();
  Future<ShoplistItemModel> getById(int id);
  Future<int?> insert(ShoplistItemModel shoplistItemModel);
  Future<int?> update(ShoplistItemModel shoplistItemModel);
  Future<int?> delete(int id);
}
