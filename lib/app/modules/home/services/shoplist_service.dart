import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_model.dart';
import 'package:myshoplist/app/modules/home/repositories/interfaces/shoplist_repository_interface.dart';
import 'package:myshoplist/app/modules/home/services/interfaces/shoplist_service_interface.dart';

class ShoplistService extends Disposable implements IShoplistService {
  final IShoplistRepository shoplistRepository;

  ShoplistService({required this.shoplistRepository});

  @override
  Future<List<ShoplistModel>> getAll() async =>
      await this.shoplistRepository.getAll();

  @override
  Future<ShoplistModel> getById(int id) async =>
      await this.shoplistRepository.getById(id);

  @override
  Future<int> getCount() async => await this.shoplistRepository.getCount();

  @override
  Future<int?> insert(ShoplistModel shoplistModel) async =>
      await this.shoplistRepository.insert(shoplistModel);

  @override
  Future<int?> update(ShoplistModel shoplistModel) async =>
      await this.shoplistRepository.update(shoplistModel);

  @override
  Future<int?> delete(int id) async => await this.shoplistRepository.delete(id);

  @override
  void dispose() {}
}
