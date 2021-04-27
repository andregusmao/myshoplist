import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshoplist/constants/shoplist_constants.dart';
import 'package:myshoplist/models/shoplist_model.dart';
import 'package:myshoplist/controllers/shoplist_controller.dart';
import 'package:myshoplist/ui/components/app/app_bar_icon_component.dart';
import 'package:myshoplist/ui/components/app/floating_button_component.dart';
import 'package:myshoplist/ui/views/shoplist/shoplist_items_view.dart';

class ShoplistEditView extends StatefulWidget {
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
  final TextEditingController nameController = TextEditingController();

  _ShoplistEditViewState(this.shoplistModel);

  @override
  void initState() {
    this.nameController.text = this.shoplistModel.name;
    super.initState();
  }

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
            AppBarIconComponent(icon: SHOPLIST_ICON),
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
                  controller: this.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'nome é obrigatório';
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
                shoplistItemModel: this.shoplistModel.items ?? [],
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
              icon: FontAwesomeIcons.trash,
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
                          controller
                              .delete(this.shoplistModel.id!)
                              .whenComplete(() {
                            Navigator.of(dialogContext).pop();
                            Modular.to.pop(context);
                          });
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
              icon: FontAwesomeIcons.solidSave,
              key: UniqueKey(),
              onTap: () {
                if (_editForm.currentState!.validate()) {
                  controller
                      .save(
                        ShoplistModel(
                          id: this.shoplistModel.id,
                          name: this.nameController.text,
                          createdAt: this.shoplistModel.createdAt,
                          updatedAt: DateTime.now(),
                        ),
                      )
                      .whenComplete(() => Modular.to.pop(context));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
