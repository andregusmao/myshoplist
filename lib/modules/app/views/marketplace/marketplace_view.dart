import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/components/app_bar_icon_component.dart';
import 'package:myshoplist/components/floating_button_component.dart';
import 'package:myshoplist/components/fullscreen_message_component.dart';
import 'package:myshoplist/components/marketplace_tile_component.dart';
import 'package:myshoplist/modules/app/controllers/marketplace_controller.dart';
import 'package:myshoplist/modules/app/models/marketplace_model.dart';

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
          onPressed: () => Modular.to.pop(),
        ),
        leadingWidth: 24,
        title: Row(
          children: [
            AppBarIconComponent(iconPath: 'lib/assets/icons/marketplace.png'),
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
                  onTap: () => Modular.to
                      .pushNamed(
                        '/marketplaces/edit',
                        arguments: list[index],
                      )
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
        icon: Icons.add,
        onTap: () => Modular.to.pushNamed('/marketplaces/create'),
      ),
    );
  }
}
