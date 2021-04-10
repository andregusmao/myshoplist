import 'package:myshoplist/app/modules/home/models/shoplist_model.dart';

abstract class IShoplistService {
  Future<List<ShoplistModel>> getAll();
  Future<int> getCount();
  Future<ShoplistModel> getById(int id);
  Future<int> insert(ShoplistModel marketplaceModel);
  Future<int> update(ShoplistModel marketplaceModel);
  Future<int> delete(int id);
}
