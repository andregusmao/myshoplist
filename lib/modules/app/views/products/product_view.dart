import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/components/app/app_bar_icon_component.dart';
import 'package:myshoplist/components/app/fullscreen_message_component.dart';
import 'package:myshoplist/modules/app/controllers/products_controller.dart';
import 'package:myshoplist/modules/app/models/product_model.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends ModularState<ProductView, ProductsController> {
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
            AppBarIconComponent(iconPath: 'lib/assets/icons/product.png'),
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
                onTap: () => Modular.to
                    .pushNamed(
                      '/products/edit',
                      arguments: list[index],
                    )
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
    );
  }
}
