import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/modules/app/models/purchase_item_model.dart';
import 'package:myshoplist/modules/app/repositories/interfaces/purchase_item_repository_interface.dart';
import 'package:myshoplist/modules/app/services/interfaces/purchase_item_service_interface.dart';

class PurchaseItemService extends Disposable implements IPurchaseItemService {
  final IPurchaseItemRepository purchaseItemRepository;

  PurchaseItemService({required this.purchaseItemRepository});

  @override
  Future<List<PurchaseItemModel>> getAll() async =>
      await this.purchaseItemRepository.getAll();

  @override
  Future<PurchaseItemModel> getById(int id) async =>
      await this.purchaseItemRepository.getById(id);

  @override
  Future<int> getCount() async => await this.purchaseItemRepository.getCount();

  @override
  Future<int?> insert(PurchaseItemModel purchaseItemModel) async =>
      await this.purchaseItemRepository.insert(purchaseItemModel);

  @override
  Future<int?> update(PurchaseItemModel purchaseItemModel) async =>
      await this.purchaseItemRepository.update(purchaseItemModel);

  @override
  Future<int?> delete(int id) async =>
      await this.purchaseItemRepository.delete(id);

  @override
  void dispose() {}
}
