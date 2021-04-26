import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/controllers/home_controller.dart';
import 'package:myshoplist/ui/views/home/home_view.dart';
import 'package:myshoplist/modules/marketplace_module.dart';
import 'package:myshoplist/modules/product_module.dart';
import 'package:myshoplist/modules/purchase_module.dart';
import 'package:myshoplist/modules/shoplist_module.dart';

class HomeModule extends Module {
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomeView()),
    ModuleRoute('/marketplaces', module: MarketplaceModule()),
    ModuleRoute('/products', module: ProductModule()),
    ModuleRoute('/shoplists', module: ShoplistModule()),
    ModuleRoute('/purchases', module: PurchaseModule()),
  ];
}
