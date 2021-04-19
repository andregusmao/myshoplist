import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/components/floating_button_component.dart';
import 'package:myshoplist/app/modules/home/controllers/shoplist_controller.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_model.dart';
import 'package:myshoplist/app/modules/home/views/shoplist_items_view.dart';

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
  final GlobalKey<FormState> _editForm = GlobalKey<FormState>();

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
              child: Icon(Icons.list_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Editar lista'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _editForm,
                child: TextFormField(
                  controller: this.widget.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome é obrigatório';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'nome da lista',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShoplistItemsView(
                shoplistId: this.shoplistModel.id!,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FloatingButtonComponent(
              icon: Icons.delete_rounded,
              key: UniqueKey(),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: Text('Excluir lista'),
                    content: Text('Tem certeza que deseja excluir essa lista?'),
                    actions: [
                      TextButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(dialogContext).pop(),
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () {
                          controller.delete(this.shoplistModel.id!);
                          Navigator.of(dialogContext).pop();
                          Modular.to.pop();
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: FloatingButtonComponent(
              icon: Icons.save_rounded,
              key: UniqueKey(),
              onTap: () {
                if (_editForm.currentState!.validate()) {
                  controller.update(ShoplistModel(
                    id: this.shoplistModel.id,
                    name: this.widget.nameController.text,
                  ));
                  Modular.to.pop();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
