import 'package:myshoplist/models/marketplace_model.dart';

abstract class IMarketplaceRepository {
  Future<List<MarketplaceModel>> getAll();
  Future<int> getCount();
  Future<MarketplaceModel> getById(int id);
  Future<int?> insert(MarketplaceModel marketplaceModel);
  Future<int?> update(MarketplaceModel marketplaceModel);
  Future<int?> delete(int id);
}
