import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/modules/product/product_controller.dart';
import 'package:myshoplist/modules/product/views/product_view.dart';
import 'package:myshoplist/repositories/product_repository.dart';
import 'package:myshoplist/services/product_service.dart';

class ProductModule extends Module {
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductRepository()),
    Bind.lazySingleton((i) => ProductService(productRepository: i.get())),
    Bind.lazySingleton((i) => ProductController(productService: i.get())),
  ];
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProductView()),
  ];
}
