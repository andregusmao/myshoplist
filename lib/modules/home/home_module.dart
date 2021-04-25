import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/modules/home/home_controller.dart';
import 'package:myshoplist/modules/home/views/home_view.dart';
import 'package:myshoplist/modules/marketplace/marketplace_module.dart';
import 'package:myshoplist/modules/product/product_module.dart';
import 'package:myshoplist/modules/purchase/purchase_module.dart';
import 'package:myshoplist/modules/shoplist/shoplist_module.dart';

class HomeModule extends Module {
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomeView()),
    ModuleRoute('/marketplaces', module: MarketplaceModule()),
    ModuleRoute('/products', module: ProductModule()),
    ModuleRoute('/shoplists', module: ShoplistModule()),
    ModuleRoute('/purchases', module: PurchaseModule()),
  ];
}
