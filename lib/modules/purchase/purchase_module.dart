import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/modules/purchase/view/purchase_view.dart';
import 'package:myshoplist/repositories/purchase_item_repository.dart';
import 'package:myshoplist/repositories/purchase_repository.dart';
import 'package:myshoplist/services/purchase_item_service.dart';
import 'package:myshoplist/services/purchase_service.dart';

class PurchaseModule extends Module {
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PurchaseRepository()),
    Bind.lazySingleton((i) => PurchaseItemRepository()),
    Bind.lazySingleton((i) => PurchaseService(purchaseRepository: i.get())),
    Bind.lazySingleton(
        (i) => PurchaseItemService(purchaseItemRepository: i.get())),
  ];
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PurchaseView()),
  ];
}
