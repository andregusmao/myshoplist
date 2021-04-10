import 'package:myshoplist/app/modules/home/repositories/purchase_repository.dart';
import 'package:myshoplist/app/modules/home/repositories/shoplist_repository.dart';
import 'package:myshoplist/app/modules/home/repositories/product_repository.dart';
import 'package:myshoplist/app/modules/home/repositories/marketplace_repository.dart';
import 'package:myshoplist/app/modules/home/services/purchase_service.dart';
import 'package:myshoplist/app/modules/home/services/shoplist_service.dart';
import 'package:myshoplist/app/modules/home/services/product_service.dart';
import 'package:myshoplist/app/modules/home/services/marketplace_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/modules/home/controllers/home_controller.dart';

import 'views/home_view.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PurchaseRepository()),
    Bind.lazySingleton((i) => ShoplistRepository()),
    Bind.lazySingleton((i) => ProductRepository()),
    Bind.lazySingleton((i) => MarketplaceRepository()),
    Bind.lazySingleton((i) => PurchaseService(purchaseRepository: i.get())),
    Bind.lazySingleton((i) => ShoplistService(shoplistRepository: i.get())),
    Bind.lazySingleton((i) => ProductService(productRepository: i.get())),
    Bind.lazySingleton(
        (i) => MarketplaceService(marketplaceRepository: i.get())),
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomeView(),
    ),
  ];
}
