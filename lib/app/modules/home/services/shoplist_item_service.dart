import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_item_model.dart';
import 'package:myshoplist/app/modules/home/repositories/interfaces/shoplist_item_repository_interface.dart';
import 'package:myshoplist/app/modules/home/services/interfaces/shoplist_item_service_interface.dart';

class ShoplistItemService extends Disposable implements IShoplistItemService {
  final IShoplistItemRepository shoplistItemRepository;

  ShoplistItemService({required this.shoplistItemRepository});

  @override
  Future<List<ShoplistItemModel>> getAll(int shoplistId) async =>
      await this.shoplistItemRepository.getAll(shoplistId);

  @override
  Future<ShoplistItemModel> getById(int id) async =>
      await this.shoplistItemRepository.getById(id);

  @override
  Future<int> getCount(int shoplistId) async =>
      await this.shoplistItemRepository.getCount(shoplistId);

  @override
  Future<int?> insert(ShoplistItemModel shoplistItemModel) async =>
      await this.shoplistItemRepository.insert(shoplistItemModel);

  @override
  Future<int?> update(ShoplistItemModel shoplistItemModel) async =>
      await this.shoplistItemRepository.update(shoplistItemModel);

  @override
  Future<int?> delete(int id) async =>
      await this.shoplistItemRepository.delete(id);

  @override
  void dispose() {}
}
