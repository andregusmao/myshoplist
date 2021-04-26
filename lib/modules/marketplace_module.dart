import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/controllers/marketplace_controller.dart';
import 'package:myshoplist/ui/views/marketplace/marketplace_create_view.dart';
import 'package:myshoplist/ui/views/marketplace/marketplace_edit_view.dart';
import 'package:myshoplist/ui/views/marketplace/marketplace_view.dart';
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
    ChildRoute('/', child: (_, __) => MarketplaceView()),
    ChildRoute('/create', child: (_, __) => MarketplaceCreateView()),
    ChildRoute('/edit',
        child: (_, args) => MarketplaceEditView(
              marketplaceModel: args.data,
            )),
  ];
}
