import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/components/fullscreen_message_component.dart';
import 'package:myshoplist/app/components/shoplist_item_tile_component.dart';
import 'package:myshoplist/app/modules/home/controllers/shoplist_item_controller.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_item_model.dart';

class ShoplistItemsView extends StatefulWidget {
  final int shoplistId;

  const ShoplistItemsView({Key? key, required this.shoplistId})
      : super(key: key);

  @override
  _ShoplistItemsViewState createState() => _ShoplistItemsViewState();
}

class _ShoplistItemsViewState
    extends ModularState<ShoplistItemsView, ShoplistItemController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'código de barras',
              suffixIcon: IconButton(
                icon: Image(
                  image: AssetImage('lib/app/assets/icons/barcode.png'),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
        FutureBuilder<List<ShoplistItemModel>>(
            future: controller.list(),
            initialData: [],
            builder: (context, value) {
              List<ShoplistItemModel> list = value.data ?? [];
              return list.isNotEmpty
                  ? ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 96),
                      itemBuilder: (context, index) =>
                          ShoplistItemTileComponent(),
                    )
                  : FullscreenMessageComponent(
                      message: 'Nenhum item cadastrado',
                    );
            })
      ],
    );
  }
}
