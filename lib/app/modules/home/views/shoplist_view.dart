import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/components/floating_button_component.dart';
import 'package:myshoplist/app/components/fullscreen_message_component.dart';
import 'package:myshoplist/app/components/shoplist_tile_component.dart';
import 'package:myshoplist/app/modules/home/controllers/shoplist_controller.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_model.dart';

class ShoplistView extends StatefulWidget {
  @override
  _ShoplistViewState createState() => _ShoplistViewState();
}

class _ShoplistViewState
    extends ModularState<ShoplistView, ShoplistController> {
  final GlobalKey<FormState> _insertForm = GlobalKey<FormState>();

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
              child: Icon(Icons.list_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Listas de compras'),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<ShoplistModel>>(
        future: controller.list(),
        initialData: [],
        builder: (context, value) {
          List<ShoplistModel> list = value.data ?? [];
          return list.isNotEmpty
              ? ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 96),
                  itemBuilder: (context, index) => GestureDetector(
                    child: ShoplistTileComponent(
                        name: list[index].name,
                        items: controller.getItemsCount(
                          list[index].id!,
                        ),
                        createDate: list[index].createDate!),
                    onTap: () => Modular.to
                        .pushNamed(
                      '/shoplists/edit',
                      arguments: list[index],
                    )
                        .whenComplete(() {
                      setState(() {});
                    }),
                  ),
                  key: UniqueKey(),
                )
              : FullscreenMessageComponent(
                  message: 'Nenhuma lista cadastrada',
                );
        },
      ),
      floatingActionButton: FloatingButtonComponent(
        icon: Icons.add,
        onTap: () => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            TextEditingController nameController = TextEditingController();
            return AlertDialog(
              title: Text('Nova lista'),
              scrollable: true,
              content: SizedBox(
                width: double.maxFinite,
                child: Form(
                  key: _insertForm,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          print('Value: $value');
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
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  child: Text('Fechar'),
                  onPressed: () => Navigator.pop(dialogContext),
                ),
                TextButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    if (_insertForm.currentState!.validate()) {
                      controller.save(
                        ShoplistModel(
                          name: nameController.text,
                        ),
                      );
                      Navigator.pop(dialogContext);
                      setState(() {});
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
