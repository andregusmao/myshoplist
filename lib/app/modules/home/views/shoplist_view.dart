import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/modules/home/controllers/shoplist_controller.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_model.dart';

class ShoplistView extends StatelessWidget {
  final ShoplistController shoplistController = ShoplistController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Listas de Compras',
          ),
        ),
      ),
      body: FutureBuilder<List<ShoplistModel>>(
        future: shoplistController.list(),
        builder: (context, value) {
          return Text('Total: ${value.data?.length ?? 0}');
        },
      ),
    );
  }
}
