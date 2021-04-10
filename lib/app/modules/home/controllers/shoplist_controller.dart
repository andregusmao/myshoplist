import 'package:mobx/mobx.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_model.dart';
import 'package:myshoplist/app/modules/home/repositories/shoplist_repository.dart';
import 'package:myshoplist/app/modules/home/services/interfaces/shoplist_service_interface.dart';
import 'package:myshoplist/app/modules/home/services/shoplist_service.dart';
part 'shoplist_controller.g.dart';

class ShoplistController = _ShoplistControllerBase with _$ShoplistController;

abstract class _ShoplistControllerBase with Store {
  final IShoplistService shoplistService =
      ShoplistService(shoplistRepository: ShoplistRepository());

  _ShoplistControllerBase() {
    this.shopslists = this.list();
  }

  @observable
  Future<List<ShoplistModel>>? shopslists;

  @action
  Future<List<ShoplistModel>> list() async =>
      await this.shoplistService.getAll();

  @action
  Future<ShoplistModel> load(int id) async =>
      await this.shoplistService.getById(id);

  @action
  Future<int?> save(ShoplistModel shoplistModel) async {
    return await this.shoplistService.insert(shoplistModel);
  }

  @action
  Future<int?> update(ShoplistModel shoplistModel) async {
    await this.shoplistService.update(shoplistModel);
  }

  @action
  Future<int?> delete(int id) async {
    await this.shoplistService.delete(id);
  }
}
