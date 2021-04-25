import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/models/product_model.dart';
import 'package:myshoplist/repositories/interfaces/product_repository_interface.dart';
import 'package:myshoplist/services/interfaces/product_service_interface.dart';

class ProductService extends Disposable implements IProductService {
  final IProductRepository productRepository;

  ProductService({required this.productRepository});

  @override
  Future<List<ProductModel>> getAll() async =>
      await this.productRepository.getAll();

  @override
  Future<ProductModel> getById(int id) async =>
      await this.productRepository.getById(id);

  @override
  Future<int> getCount() async => await this.productRepository.getCount();

  @override
  Future<int?> insert(ProductModel productModel) async =>
      await this.productRepository.insert(productModel);

  @override
  Future<int?> update(ProductModel productModel) async =>
      await this.productRepository.update(productModel);

  @override
  Future<int?> delete(int id) async => await this.productRepository.delete(id);

  @override
  void dispose() {}
}
