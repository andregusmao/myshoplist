import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/modules/app/controllers/marketplace_controller.dart';
import 'package:myshoplist/modules/app/controllers/products_controller.dart';
import 'package:myshoplist/modules/app/controllers/shoplist_controller.dart';
import 'package:myshoplist/repositories/marketplace_repository.dart';
import 'package:myshoplist/repositories/product_repository.dart';
import 'package:myshoplist/repositories/purchase_item_repository.dart';
import 'package:myshoplist/repositories/purchase_repository.dart';
import 'package:myshoplist/repositories/shoplist_item_repository.dart';
import 'package:myshoplist/repositories/shoplist_repository.dart';
import 'package:myshoplist/services/marketplace_service.dart';
import 'package:myshoplist/services/product_service.dart';
import 'package:myshoplist/services/purchase_item_service.dart';
import 'package:myshoplist/services/purchase_service.dart';
import 'package:myshoplist/services/shoplist_item_service.dart';
import 'package:myshoplist/services/shoplist_service.dart';
import 'package:myshoplist/modules/app/views/home/home_view.dart';
import 'package:myshoplist/modules/app/views/marketplace/marketplace_create_view.dart';
import 'package:myshoplist/modules/app/views/marketplace/marketplace_view.dart';
import 'package:myshoplist/modules/app/views/marketplace/marketplace_edit_view.dart';
import 'package:myshoplist/modules/app/views/products/product_view.dart';
import 'package:myshoplist/modules/app/views/shoplist/shoplist_edit_view.dart';
import 'package:myshoplist/modules/app/views/shoplist/shoplist_view.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // Repositories
    Bind.lazySingleton((i) => MarketplaceRepository()),
    Bind.lazySingleton((i) => ProductRepository()),
    Bind.lazySingleton((i) => ShoplistRepository()),
    Bind.lazySingleton((i) => ShopListItemRepository()),
    Bind.lazySingleton((i) => PurchaseRepository()),
    Bind.lazySingleton((i) => PurchaseItemRepository()),
    // Services
    Bind.lazySingleton(
        (i) => MarketplaceService(marketplaceRepository: i.get())),
    Bind.lazySingleton((i) => ProductService(productRepository: i.get())),
    Bind.lazySingleton((i) => ShoplistService(shoplistRepository: i.get())),
    Bind.lazySingleton(
        (i) => ShoplistItemService(shoplistItemRepository: i.get())),
    Bind.lazySingleton((i) => PurchaseService(purchaseRepository: i.get())),
    Bind.lazySingleton(
        (i) => PurchaseItemService(purchaseItemRepository: i.get())),
    // Controllers
    Bind.lazySingleton((i) => ShoplistController(
          shoplistItemService: i.get(),
          shoplistService: i.get(),
        )),
    Bind.lazySingleton(
        (i) => MarketplaceController(marketplaceService: i.get())),
    Bind.lazySingleton((i) => ProductsController(productService: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    // Home
    ChildRoute('/', child: (_, args) => HomeView()),
    // Shoplist
    ChildRoute('/shoplists', child: (_, args) => ShoplistView()),
    ChildRoute('/shoplists/edit',
        child: (_, args) => ShoplistEditView(
              shoplistModel: args.data,
            )),
    // Marketplace
    ChildRoute('/marketplaces', child: (_, args) => MarketplaceView()),
    ChildRoute('/marketplaces/create',
        child: (_, args) => MarketplaceCreateView()),
    ChildRoute('/marketplaces/edit',
        child: (_, args) => MarketplaceEditView(
              marketplaceModel: args.data,
            )),
    // Product
    ChildRoute('/products', child: (_, args) => ProductView()),
  ];
}
