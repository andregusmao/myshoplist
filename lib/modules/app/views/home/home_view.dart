import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshoplist/components/app/home_button_component.dart';
import 'package:myshoplist/components/app/message_dialog_component.dart';
import 'package:myshoplist/constants/marketplace_constants.dart';
import 'package:myshoplist/constants/product_constants.dart';
import 'package:myshoplist/constants/purchase_constants.dart';
import 'package:myshoplist/constants/shoplist_constants.dart';

class HomeView extends StatelessWidget {
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
              onTap: () => Modular.to.pushNamed('/marketplaces'),
            ),
            HomeButtonComponent(
              icon: PRODUCT_ICON,
              title: 'Produtos',
              onTap: () => Modular.to.pushNamed('/products'),
            ),
            HomeButtonComponent(
              icon: SHOPLIST_ICON,
              title: 'Listas de Compras',
              onTap: () => Modular.to.pushNamed('/shoplists'),
            ),
            HomeButtonComponent(
              icon: PURCHASE_ICON,
              title: 'Compras',
              // onTap: () => Modular.to.pushNamed('/purchases'),
              onTap: () => MessageDialogComponent.showSimpleMessage(
                context,
                'Atenção',
                'Função não implementada',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
