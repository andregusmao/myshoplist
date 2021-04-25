import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshoplist/constants/marketplace_constants.dart';
import 'package:myshoplist/models/marketplace_model.dart';
import 'package:myshoplist/controllers/marketplace_controller.dart';
import 'package:myshoplist/ui/components/app/app_bar_icon_component.dart';
import 'package:myshoplist/ui/components/app/floating_button_component.dart';
import 'package:myshoplist/ui/components/app/fullscreen_message_component.dart';
import 'package:myshoplist/ui/components/marketplace/marketplace_tile_component.dart';

class MarketplaceView extends StatefulWidget {
  @override
  _MarketplaceViewState createState() => _MarketplaceViewState();
}

class _MarketplaceViewState
    extends ModularState<MarketplaceView, MarketplaceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Modular.to.pop(context),
        ),
        leadingWidth: 24,
        title: Row(
          children: [
            AppBarIconComponent(icon: MARKETPLACE_ICON),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Estabelecimentos'),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<MarketplaceModel>>(
        future: controller.list(),
        initialData: [],
        builder: (context, value) {
          List<MarketplaceModel> list = value.data ?? [];
          if (list.isNotEmpty) {
            return ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 96),
              itemBuilder: (context, index) => GestureDetector(
                child: GestureDetector(
                  child: MarketplaceTileComponent(
                    name: list[index].name,
                    address: list[index].address,
                  ),
                  onTap: () => controller
                      .edit(list[index])
                      .whenComplete(() => setState(() {})),
                ),
              ),
              key: UniqueKey(),
            );
          } else {
            return FullscreenMessageComponent(
              message: 'Nenhum estabelecimento cadastrado',
            );
          }
        },
      ),
      floatingActionButton: FloatingButtonComponent(
        icon: FontAwesomeIcons.plus,
        onTap: () => controller.create().whenComplete(() => setState(() {})),
      ),
    );
  }
}
