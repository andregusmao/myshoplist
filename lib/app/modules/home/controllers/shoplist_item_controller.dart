import 'package:mobx/mobx.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_item_model.dart';
import 'package:myshoplist/app/modules/home/services/interfaces/shoplist_item_service_interface.dart';
part 'shoplist_item_controller.g.dart';

class ShoplistItemController = _ShoplistItemControllerBase
    with _$ShoplistItemController;

abstract class _ShoplistItemControllerBase with Store {
  final IShoplistItemService shoplistItemService;
  final int shoplistId;

  _ShoplistItemControllerBase(
      {required this.shoplistId, required this.shoplistItemService}) {
    this.shoplistItems = list();
  }

  @observable
  Future<List<ShoplistItemModel>>? shoplistItems;

  @action
  Future<List<ShoplistItemModel>> list() async {
    return await this.shoplistItemService.getAll(shoplistId);
  }
}
