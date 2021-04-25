import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/modules/marketplace/marketplace_controller.dart';
import 'package:myshoplist/modules/marketplace/views/marketplace_create_view.dart';
import 'package:myshoplist/modules/marketplace/views/marketplace_edit_view.dart';
import 'package:myshoplist/modules/marketplace/views/marketplace_view.dart';
import 'package:myshoplist/repositories/marketplace_repository.dart';
import 'package:myshoplist/services/marketplace_service.dart';

class MarketplaceModule extends Module {
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MarketplaceRepository()),
    Bind.lazySingleton(
        (i) => MarketplaceService(marketplaceRepository: i.get())),
    Bind.lazySingleton(
        (i) => MarketplaceController(marketplaceService: i.get())),
  ];
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MarketplaceView()),
    ChildRoute('/create', child: (_, args) => MarketplaceCreateView()),
    ChildRoute('/edit',
        child: (_, args) => MarketplaceEditView(
              marketplaceModel: args.data,
            )),
  ];
}
