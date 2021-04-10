import 'package:myshoplist/app/modules/home/models/product_model.dart';

abstract class IProductService {
  Future<List<ProductModel>> getAll();
  Future<int> getCount();
  Future<ProductModel> getById(int id);
  Future<int> insert(ProductModel marketplaceModel);
  Future<int> update(ProductModel marketplaceModel);
  Future<int> delete(int id);
}
