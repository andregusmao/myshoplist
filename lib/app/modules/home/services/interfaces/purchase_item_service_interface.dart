import 'package:myshoplist/app/modules/home/models/purchase_item_model.dart';

abstract class IPurchaseItemService {
  Future<List<PurchaseItemModel>> getAll();
  Future<int> getCount();
  Future<PurchaseItemModel> getById(int id);
  Future<int> insert(PurchaseItemModel marketplaceModel);
  Future<int> update(PurchaseItemModel marketplaceModel);
  Future<int> delete(int id);
}
