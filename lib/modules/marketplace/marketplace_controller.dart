import 'package:mobx/mobx.dart';
import 'package:myshoplist/models/marketplace_model.dart';
import 'package:myshoplist/services/interfaces/marketplace_service_interface.dart';
part 'marketplace_controller.g.dart';

class MarketplaceController = _MarketplaceControllerBase
    with _$MarketplaceController;

abstract class _MarketplaceControllerBase with Store {
  final IMarketplaceService marketplaceService;

  _MarketplaceControllerBase({required this.marketplaceService}) {
    this.marketplaces = this.list();
  }

  @observable
  Future<List<MarketplaceModel>>? marketplaces;

  @action
  Future<List<MarketplaceModel>> list() async =>
      await this.marketplaceService.getAll();

  @action
  Future<MarketplaceModel> load(int id) async =>
      await this.marketplaceService.getById(id);

  @action
  Future<int?> save(MarketplaceModel marketplaceModel) async =>
      marketplaceModel.id == null
          ? await this.marketplaceService.insert(marketplaceModel)
          : await this.marketplaceService.update(marketplaceModel);

  @action
  Future<int?> delete(int id) async => await this.marketplaceService.delete(id);
}
