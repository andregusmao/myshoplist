import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/modules/home_module.dart';
import 'package:myshoplist/ui/views/app/app_launch_view.dart';

class AppModule extends Module {
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => AppLaunchView()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
