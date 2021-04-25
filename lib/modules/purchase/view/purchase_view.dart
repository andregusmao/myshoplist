import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/components/app/app_bar_icon_component.dart';
import 'package:myshoplist/constants/purchase_constants.dart';

class PurchaseView extends StatefulWidget {
  @override
  _PurchaseViewState createState() => _PurchaseViewState();
}

class _PurchaseViewState extends State<PurchaseView> {
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
            AppBarIconComponent(icon: PURCHASE_ICON),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Compras'),
            ),
          ],
        ),
      ),
    );
  }
}
