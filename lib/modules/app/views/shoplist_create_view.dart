import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/components/floating_button_component.dart';
import 'package:myshoplist/modules/app/controllers/shoplist_controller.dart';
import 'package:myshoplist/modules/app/models/shoplist_model.dart';

class ShoplistCreateView extends StatefulWidget {
  final TextEditingController nameController = TextEditingController();
  @override
  _ShoplistCreateViewState createState() => _ShoplistCreateViewState();
}

class _ShoplistCreateViewState
    extends ModularState<ShoplistCreateView, ShoplistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Modular.to.pop(),
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.insert_drive_file_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Criar nova lista'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: this.widget.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'nome da lista',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingButtonComponent(
        icon: Icons.save_rounded,
        onTap: () {
          controller.save(
            ShoplistModel(
              name: this.widget.nameController.text,
            ),
          );
          Modular.to.pop();
        },
      ),
    );
  }
}
