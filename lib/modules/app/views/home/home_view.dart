import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/components/app/home_button_component.dart';
import 'package:myshoplist/components/app/message_dialog_component.dart';

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
              icon: AssetImage('lib/app/assets/icons/marketplace.png'),
              title: 'Estabelecimentos',
              onTap: () => Modular.to.pushNamed('/marketplaces'),
            ),
            HomeButtonComponent(
              icon: AssetImage('lib/app/assets/icons/product.png'),
              title: 'Produtos',
              onTap: () => Modular.to.pushNamed('/products'),
            ),
            HomeButtonComponent(
              icon: AssetImage('lib/app/assets/icons/shoplist.png'),
              title: 'Listas de Compras',
              onTap: () => Modular.to.pushNamed('/shoplists'),
            ),
            HomeButtonComponent(
              icon: AssetImage('lib/app/assets/icons/purchase.png'),
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
