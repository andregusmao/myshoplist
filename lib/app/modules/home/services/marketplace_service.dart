import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/modules/home/models/marketplace_model.dart';
import 'package:myshoplist/app/modules/home/repositories/interfaces/marketplace_repository_interface.dart';
import 'package:myshoplist/app/modules/home/services/interfaces/marketplace_service_interface.dart';

class MarketplaceService extends Disposable implements IMarketplaceService {
  final IMarketplaceRepository marketplaceRepository;

  MarketplaceService({required this.marketplaceRepository});

  @override
  Future<List<MarketplaceModel>> getAll() async =>
      await this.marketplaceRepository.getAll();

  @override
  Future<MarketplaceModel> getById(int id) async =>
      await this.marketplaceRepository.getById(id);

  @override
  Future<int> getCount() async => await this.marketplaceRepository.getCount();

  @override
  Future<int?> insert(MarketplaceModel marketplaceModel) async =>
      await this.marketplaceRepository.insert(marketplaceModel);

  @override
  Future<int?> update(MarketplaceModel marketplaceModel) async =>
      await this.marketplaceRepository.update(marketplaceModel);

  @override
  Future<int?> delete(int id) async =>
      await this.marketplaceRepository.delete(id);

  @override
  void dispose() {}
}
