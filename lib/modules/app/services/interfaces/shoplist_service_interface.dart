import 'package:myshoplist/modules/app/models/shoplist_model.dart';

abstract class IShoplistService {
  Future<List<ShoplistModel>> getAll();
  Future<int> getCount();
  Future<ShoplistModel> getById(int id);
  Future<int?> insert(ShoplistModel shoplistModel);
  Future<int?> update(ShoplistModel shoplistModel);
  Future<int?> delete(int id);
}
