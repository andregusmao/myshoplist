// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshoplist/components/app/app_bar_icon_component.dart';
import 'package:myshoplist/components/app/floating_button_component.dart';
import 'package:myshoplist/constants/marketplace_constants.dart';
import 'package:myshoplist/modules/app/controllers/marketplace_controller.dart';
import 'package:myshoplist/modules/app/models/marketplace_model.dart';

class MarketplaceCreateView extends StatefulWidget {
  @override
  _MarketplaceCreateViewState createState() => _MarketplaceCreateViewState();
}

class _MarketplaceCreateViewState
    extends ModularState<MarketplaceCreateView, MarketplaceController> {
  final GlobalKey<FormState> _insertForm = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  // Completer<GoogleMapController> _controller = Completer();

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
            AppBarIconComponent(icon: MARKETPLACE_ICON),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Novo estabelecimento'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _insertForm,
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
      floatingActionButton: FloatingButtonComponent(
        icon: FontAwesomeIcons.solidSave,
        onTap: () {
          if (this._insertForm.currentState!.validate()) {
            controller.save(
              MarketplaceModel(
                name: this.nameController.text,
                address: this.addressController.text,
              ),
            );
            Modular.to.pop(context);
          }
        },
      ),
    );
  }
}
