import 'package:myshoplist/models/product_model.dart';

abstract class IProductService {
  Future<List<ProductModel>> getAll();
  Future<int> getCount();
  Future<ProductModel> getById(int id);
  Future<int?> insert(ProductModel productModel);
  Future<int?> update(ProductModel productModel);
  Future<int?> delete(int id);
}
