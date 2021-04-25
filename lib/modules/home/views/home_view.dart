import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/components/app/home_button_component.dart';
import 'package:myshoplist/constants/marketplace_constants.dart';
import 'package:myshoplist/constants/product_constants.dart';
import 'package:myshoplist/constants/purchase_constants.dart';
import 'package:myshoplist/constants/shoplist_constants.dart';
import 'package:myshoplist/modules/home/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ModularState<HomeView, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('My Shoplist'),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 3,
          children: [
            HomeButtonComponent(
                icon: MARKETPLACE_ICON,
                title: 'Estabelecimentos',
                onTap: () => controller.navigateToMarketplaces()),
            HomeButtonComponent(
              icon: PRODUCT_ICON,
              title: 'Produtos',
              onTap: () => controller.navigateToProducts(),
            ),
            HomeButtonComponent(
              icon: SHOPLIST_ICON,
              title: 'Listas de Compras',
              onTap: () => controller.navigateToShoplists(),
            ),
            HomeButtonComponent(
              icon: PURCHASE_ICON,
              title: 'Compras',
              // onTap: () => Modular.to.pushNamed('/purchases'),
              onTap: () => controller.navigateToPurchases(),
            ),
          ],
        ),
      ),
    );
  }
}
