import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/constants/product_constants.dart';
import 'package:myshoplist/ui/components/app/app_bar_icon_component.dart';

class ProductCreateView extends StatefulWidget {
  @override
  _ProductCreateViewState createState() => _ProductCreateViewState();
}

class _ProductCreateViewState extends State<ProductCreateView> {
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
            AppBarIconComponent(icon: PRODUCT_ICON),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Novo produto'),
            ),
          ],
        ),
      ),
    );
  }
}
