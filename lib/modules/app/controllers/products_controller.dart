import 'package:mobx/mobx.dart';
import 'package:myshoplist/models/product_model.dart';
import 'package:myshoplist/services/interfaces/product_service_interface.dart';
part 'products_controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  final IProductService productService;

  _ProductsControllerBase({required this.productService}) {
    this.products = this.list();
  }

  @observable
  Future<List<ProductModel>>? products;

  @action
  Future<List<ProductModel>> list() async => await this.productService.getAll();

  @action
  Future<ProductModel> load(int id) async =>
      await this.productService.getById(id);

  @action
  Future<int?> save(ProductModel productModel) async => productModel.id == null
      ? await this.productService.insert(productModel)
      : await this.productService.update(productModel);

  @action
  Future<int?> delete(int id) async => await this.productService.delete(id);
}
