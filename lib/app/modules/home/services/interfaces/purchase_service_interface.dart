import 'package:myshoplist/app/modules/home/models/purchase_model.dart';

abstract class IPurchaseService {
  Future<List<PurchaseModel>> getAll();
  Future<int> getCount();
  Future<PurchaseModel> getById(int id);
  Future<int> insert(PurchaseModel marketplaceModel);
  Future<int> update(PurchaseModel marketplaceModel);
  Future<int> delete(int id);
}
