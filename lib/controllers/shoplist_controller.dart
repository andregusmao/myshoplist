import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myshoplist/models/shoplist_model.dart';
import 'package:myshoplist/services/interfaces/shoplist_item_service_interface.dart';
import 'package:myshoplist/services/interfaces/shoplist_service_interface.dart';
part 'shoplist_controller.g.dart';

class ShoplistController = _ShoplistControllerBase with _$ShoplistController;

abstract class _ShoplistControllerBase with Store {
  final IShoplistService shoplistService;
  final IShoplistItemService shoplistItemService;

  _ShoplistControllerBase(
      {required this.shoplistItemService, required this.shoplistService}) {
    this.shopslists = this.list();
  }

  @observable
  Future<List<ShoplistModel>>? shopslists;

  int getItemsCount(int id) {
    int count = 0;
    this.shoplistItemService.getCount(id).then((value) => count = value);
    return count;
  }

  @action
  Future<List<ShoplistModel>> list() async =>
      await this.shoplistService.getAll();

  @action
  Future<ShoplistModel> load(int id) async =>
      await this.shoplistService.getById(id);

  @action
  Future edit(ShoplistModel model) async =>
      await Modular.to.pushNamed('/shoplists/edit', arguments: model);

  @action
  Future<int?> save(ShoplistModel shoplistModel) async =>
      shoplistModel.id == null
          ? await this.shoplistService.insert(shoplistModel)
          : await this.shoplistService.update(shoplistModel);

  @action
  Future<int?> delete(int id) async => await this.shoplistService.delete(id);
}
