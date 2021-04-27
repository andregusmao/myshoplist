import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/controllers/product_controller.dart';
import 'package:myshoplist/ui/views/product/product_create_view.dart';
import 'package:myshoplist/ui/views/product/product_edit_view.dart';
import 'package:myshoplist/ui/views/product/product_view.dart';
import 'package:myshoplist/repositories/product_repository.dart';
import 'package:myshoplist/services/product_service.dart';

class ProductModule extends Module {
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductRepository()),
    Bind.lazySingleton((i) => ProductService(productRepository: i.get())),
    Bind.lazySingleton((i) => ProductController(productService: i.get())),
  ];
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ProductView()),
    ChildRoute('/create', child: (_, __) => ProductCreateView()),
    ChildRoute('/edit',
        child: (_, args) => ProductEditView(
              productModel: args.data,
            )),
  ];
}
