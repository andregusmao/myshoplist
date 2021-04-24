import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/components/app/fullscreen_message_component.dart';
import 'package:myshoplist/components/shoplist/shoplist_item_tile_component.dart';
import 'package:myshoplist/modules/app/controllers/shoplist_controller.dart';
import 'package:myshoplist/modules/app/models/shoplist_item_model.dart';

class ShoplistItemsView extends StatefulWidget {
  final List<ShoplistItemModel> shoplistItemModel;

  const ShoplistItemsView({Key? key, required this.shoplistItemModel})
      : super(key: key);

  @override
  _ShoplistItemsViewState createState() => _ShoplistItemsViewState();
}

class _ShoplistItemsViewState
    extends ModularState<ShoplistItemsView, ShoplistController> {
  final TextEditingController barcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: TextFormField(
            controller: this.barcodeController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'código de barras',
              suffixIcon: IconButton(
                icon: Image(
                  image: AssetImage('lib/app/assets/icons/barcode.png'),
                ),
                onPressed: () {
                  // Open barcode scanner
                },
              ),
            ),
            keyboardType: TextInputType.number,
            onEditingComplete: () {},
          ),
        ),
        this.widget.shoplistItemModel.isNotEmpty
            ? ListView.builder(
                itemCount: this.widget.shoplistItemModel.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 96),
                itemBuilder: (context, index) => ShoplistItemTileComponent(),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 64),
                child: FullscreenMessageComponent(
                    message: 'Nenhum item cadastrado'),
              ),
      ],
    );
  }
}
