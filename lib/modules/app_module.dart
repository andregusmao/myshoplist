import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/modules/home_module.dart';

class AppModule extends Module {
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];
}
