import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshoplist/components/app/app_bar_icon_component.dart';
import 'package:myshoplist/components/app/floating_button_component.dart';
import 'package:myshoplist/constants/marketplace_constants.dart';
import 'package:myshoplist/modules/marketplace/marketplace_controller.dart';
import 'package:myshoplist/models/marketplace_model.dart';

class MarketplaceEditView extends StatefulWidget {
  final MarketplaceModel marketplaceModel;

  const MarketplaceEditView({Key? key, required this.marketplaceModel})
      : super(key: key);

  @override
  _MarketplaceEditViewState createState() =>
      _MarketplaceEditViewState(this.marketplaceModel);
}

class _MarketplaceEditViewState
    extends ModularState<MarketplaceEditView, MarketplaceController> {
  final MarketplaceModel marketplaceModel;
  final GlobalKey<FormState> _editForm = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  _MarketplaceEditViewState(this.marketplaceModel);

  @override
  Widget build(BuildContext context) {
    this.nameController.text = this.marketplaceModel.name;
    this.addressController.text = this.marketplaceModel.address ?? '';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Modular.to.pop(),
        ),
        leadingWidth: 24,
        title: Row(
          children: [
            AppBarIconComponent(icon: MARKETPLACE_ICON),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Alterar estabelecimento'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _editForm,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                    labelText: 'nome do estabelecimento',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: this.addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'endereço',
                  ),
                ),
              ),
            ],
          ),
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
                    title: Text('Excluir estabelecimento'),
                    content: Text(
                        'Tem certeza que deseja excluir esse estabelecimento?'),
                    actions: [
                      TextButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(dialogContext).pop(),
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () {
                          controller.delete(this.marketplaceModel.id!);
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
            padding: const EdgeInsets.only(left: 8.0),
            child: FloatingButtonComponent(
              icon: FontAwesomeIcons.solidSave,
              onTap: () {
                if (this._editForm.currentState!.validate()) {
                  controller.save(
                    MarketplaceModel(
                      id: this.marketplaceModel.id,
                      name: this.nameController.text,
                      address: this.addressController.text,
                    ),
                  );
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
