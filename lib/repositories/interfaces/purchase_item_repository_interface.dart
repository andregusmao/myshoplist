import 'package:myshoplist/models/purchase_item_model.dart';

abstract class IPurchaseItemRepository {
  Future<List<PurchaseItemModel>> getAll(int purchaseId);
  Future<int> getCount();
  Future<PurchaseItemModel> getById(int id);
  Future<int?> insert(PurchaseItemModel purchaseItemModel);
  Future<int?> update(PurchaseItemModel purchaseItemModel);
  Future<int?> delete(int id);
}
