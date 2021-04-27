import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @action
  void navigateToMarketplaces() => Modular.to.pushNamed('/home/marketplaces');

  @action
  void navigateToProducts() => Modular.to.pushNamed('/home/products');

  @action
  void navigateToShoplists() => Modular.to.pushNamed('/home/shoplists');

  @action
  void navigateToPurchases() => Modular.to.pushNamed('/home/purchases');
}
