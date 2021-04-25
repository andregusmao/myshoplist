import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/modules/shoplist/views/shoplist_edit_view.dart';
import 'package:myshoplist/modules/shoplist/views/shoplist_view.dart';
import 'package:myshoplist/modules/shoplist/shoplist_controller.dart';
import 'package:myshoplist/repositories/shoplist_item_repository.dart';
import 'package:myshoplist/repositories/shoplist_repository.dart';
import 'package:myshoplist/services/shoplist_item_service.dart';
import 'package:myshoplist/services/shoplist_service.dart';

class ShoplistModule extends Module {
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ShoplistRepository()),
    Bind.lazySingleton((i) => ShopListItemRepository()),
    Bind.lazySingleton((i) => ShoplistService(shoplistRepository: i.get())),
    Bind.lazySingleton(
        (i) => ShoplistItemService(shoplistItemRepository: i.get())),
    Bind.lazySingleton((i) => ShoplistController(
          shoplistItemService: i.get(),
          shoplistService: i.get(),
        )),
  ];
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ShoplistView()),
    ChildRoute('/edit',
        child: (_, args) => ShoplistEditView(
              shoplistModel: args.data,
            )),
  ];
}
