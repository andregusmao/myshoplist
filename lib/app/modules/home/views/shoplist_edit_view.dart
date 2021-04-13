import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/components/floating_button_component.dart';
import 'package:myshoplist/app/modules/home/controllers/shoplist_controller.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_model.dart';
import 'package:myshoplist/app/modules/home/views/shoplist_create_view.dart';

class ShoplistEditView extends StatefulWidget {
  final TextEditingController nameController = TextEditingController();
  final ShoplistModel shoplistModel;

  ShoplistEditView({Key? key, required this.shoplistModel}) : super(key: key);

  @override
  _ShoplistEditViewState createState() =>
      _ShoplistEditViewState(this.shoplistModel);
}

class _ShoplistEditViewState
    extends ModularState<ShoplistEditView, ShoplistController> {
  final ShoplistModel shoplistModel;

  _ShoplistEditViewState(this.shoplistModel);

  @override
  Widget build(BuildContext context) {
    this.widget.nameController.text = this.shoplistModel.name;
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
              child: Text('Editar lista'),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingButtonComponent(
              icon: Icons.delete_rounded,
              key: UniqueKey(),
              onTap: () {
                controller.delete(this.shoplistModel.id!);
                Modular.to.pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingButtonComponent(
              icon: Icons.save_rounded,
              key: UniqueKey(),
              onTap: () {
                controller.update(ShoplistModel(
                  id: this.shoplistModel.id,
                  name: this.widget.nameController.text,
                ));
                Modular.to.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
