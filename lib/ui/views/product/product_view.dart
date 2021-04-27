import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshoplist/constants/product_constants.dart';
import 'package:myshoplist/models/product_model.dart';
import 'package:myshoplist/controllers/product_controller.dart';
import 'package:myshoplist/ui/components/app/app_bar_icon_component.dart';
import 'package:myshoplist/ui/components/app/floating_button_component.dart';
import 'package:myshoplist/ui/components/app/fullscreen_message_component.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends ModularState<ProductView, ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          // onPressed: () => Modular.to.pop(context),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 24,
        title: Row(
          children: [
            AppBarIconComponent(icon: PRODUCT_ICON),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Produtos'),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: controller.list(),
        initialData: [],
        builder: (context, value) {
          List<ProductModel> list = value.data ?? [];
          if (list.isNotEmpty) {
            return ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 96),
              itemBuilder: (context, index) => GestureDetector(
                child: Text(list[index].description),
                onTap: () => controller
                    .edit(list[index])
                    .whenComplete(() => setState(() {})),
              ),
              key: UniqueKey(),
            );
          } else {
            return FullscreenMessageComponent(
              message: 'Nenhum produto cadastrado',
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
