import 'package:myshoplist/app/modules/home/models/marketplace_model.dart';

abstract class IMarketplaceService {
  Future<List<MarketplaceModel>> getAll();
  Future<int> getCount();
  Future<MarketplaceModel> getById(int id);
  Future<int> insert(MarketplaceModel marketplaceModel);
  Future<int> update(MarketplaceModel marketplaceModel);
  Future<int> delete(int id);
}
