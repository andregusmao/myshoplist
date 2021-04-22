import 'package:myshoplist/modules/app/models/purchase_model.dart';

abstract class IPurchaseRepository {
  Future<List<PurchaseModel>> getAll();
  Future<int> getCount();
  Future<PurchaseModel> getById(int id);
  Future<int?> insert(PurchaseModel purchaseModel);
  Future<int?> update(PurchaseModel purchaseModel);
  Future<int?> delete(int id);
}
