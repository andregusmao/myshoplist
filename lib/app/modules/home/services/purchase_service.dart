import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/modules/home/models/purchase_model.dart';
import 'package:myshoplist/app/modules/home/repositories/interfaces/purchase_repository_interface.dart';
import 'package:myshoplist/app/modules/home/services/interfaces/purchase_service_interface.dart';

class PurchaseService extends Disposable implements IPurchaseService {
  final IPurchaseRepository purchaseRepository;

  PurchaseService({required this.purchaseRepository});

  @override
  Future<List<PurchaseModel>> getAll() async =>
      await this.purchaseRepository.getAll();

  @override
  Future<PurchaseModel> getById(int id) async =>
      await this.purchaseRepository.getById(id);

  @override
  Future<int> getCount() async => await this.purchaseRepository.getCount();

  @override
  Future<int?> insert(PurchaseModel purchaseModel) async =>
      await this.purchaseRepository.insert(purchaseModel);

  @override
  Future<int?> update(PurchaseModel purchaseModel) async =>
      await this.purchaseRepository.update(purchaseModel);

  @override
  Future<int?> delete(int id) async => await this.purchaseRepository.delete(id);

  @override
  void dispose() {}
}
