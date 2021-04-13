import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/modules/home/controllers/shoplist_controller.dart';
import 'package:myshoplist/app/modules/home/repositories/marketplace_repository.dart';
import 'package:myshoplist/app/modules/home/repositories/product_repository.dart';
import 'package:myshoplist/app/modules/home/repositories/purchase_item_repository.dart';
import 'package:myshoplist/app/modules/home/repositories/purchase_repository.dart';
import 'package:myshoplist/app/modules/home/repositories/shoplist_item_repository.dart';
import 'package:myshoplist/app/modules/home/repositories/shoplist_repository.dart';
import 'package:myshoplist/app/modules/home/services/marketplace_service.dart';
import 'package:myshoplist/app/modules/home/services/product_service.dart';
import 'package:myshoplist/app/modules/home/services/purchase_item_service.dart';
import 'package:myshoplist/app/modules/home/services/purchase_service.dart';
import 'package:myshoplist/app/modules/home/services/shoplist_item_service.dart';
import 'package:myshoplist/app/modules/home/services/shoplist_service.dart';
import 'package:myshoplist/app/modules/home/views/shoplist_create_view.dart';
import 'package:myshoplist/app/modules/home/views/shoplist_edit_view.dart';
import 'package:myshoplist/app/modules/home/views/shoplist_view.dart';

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
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ShoplistView()),
    ChildRoute('/shoplists', child: (_, args) => ShoplistView()),
    ChildRoute('/shoplists/create', child: (_, args) => ShoplistCreateView()),
    ChildRoute('/shoplists/edit',
        child: (_, args) => ShoplistEditView(
              shoplistModel: args.data,
            )),
  ];
}
