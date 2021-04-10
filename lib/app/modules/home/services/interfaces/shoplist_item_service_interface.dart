import 'package:myshoplist/app/modules/home/models/shoplist_item_model.dart';

abstract class IShoplistItemService {
  Future<List<ShoplistItemModel>> getAll();
  Future<int> getCount();
  Future<ShoplistItemModel> getById(int id);
  Future<int> insert(ShoplistItemModel marketplaceModel);
  Future<int> update(ShoplistItemModel marketplaceModel);
  Future<int> delete(int id);
}
