import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/components/floating_button_component.dart';
import 'package:myshoplist/app/components/fullscreen_message_component.dart';
import 'package:myshoplist/app/components/shoplist_tile_component.dart';
import 'package:myshoplist/app/modules/home/controllers/shoplist_controller.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_model.dart';

class ShoplistView extends StatefulWidget {
  @override
  _ShoplistViewState createState() => _ShoplistViewState();
}

class _ShoplistViewState
    extends ModularState<ShoplistView, ShoplistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.list_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Lista de compras'),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<ShoplistModel>>(
        future: controller.list(),
        initialData: [],
        builder: (context, value) {
          List<ShoplistModel> list = value.data ?? [];
          return list.isNotEmpty
              ? ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    child: ShoplistTileComponent(
                      name: list[index].name,
                      items: controller.getItemsCount(list[index].id!),
                      createDate: list[index].createDate!,
                    ),
                    onTap: () => Modular.to
                        .pushNamed(
                      '/shoplists/edit',
                      arguments: list[index],
                    )
                        .whenComplete(() {
                      setState(() {});
                    }),
                  ),
                  key: UniqueKey(),
                )
              : FullscreenMessageComponent(
                  message: 'Nenhuma lista cadastrada',
                );
        },
      ),
      floatingActionButton: FloatingButtonComponent(
        icon: Icons.add,
        onTap: () => Modular.to.pushNamed('/shoplists/create').whenComplete(() {
          setState(() {});
        }),
      ),
    );
  }
}
