import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshoplist/constants/product_constants.dart';
import 'package:myshoplist/controllers/product_controller.dart';
import 'package:myshoplist/models/product_model.dart';
import 'package:myshoplist/ui/components/app/app_bar_icon_component.dart';
import 'package:myshoplist/ui/components/app/floating_button_component.dart';

class ProductEditView extends StatefulWidget {
  final ProductModel productModel;

  const ProductEditView({Key? key, required this.productModel})
      : super(key: key);
  @override
  _ProductEditViewState createState() =>
      _ProductEditViewState(this.productModel);
}

class _ProductEditViewState
    extends ModularState<ProductEditView, ProductController> {
  final ProductModel productModel;
  final GlobalKey<FormState> _editForm = GlobalKey<FormState>();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController packingController = TextEditingController();
  final MoneyMaskedTextController weightController =
      MoneyMaskedTextController(precision: 3);
  String unit = '';
  List<String> unities = [
    "Quilos",
    "Gramas",
    "Unidades",
    "Caixas",
  ];

  _ProductEditViewState(this.productModel);

  @override
  void initState() {
    this.barcodeController.text = this.productModel.barcode;
    this.descriptionController.text = this.productModel.description;
    this.brandController.text = this.productModel.brand ?? '';
    this.packingController.text = this.productModel.packing;
    this.weightController.text = this.productModel.weight.toString();
    this.unit = this.productModel.unit;
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
            AppBarIconComponent(icon: PRODUCT_ICON),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Editar produto'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 96),
        child: Form(
          key: this._editForm,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: this.barcodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'código de barras é obrigatório';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'código de barras',
                    suffixIcon: IconButton(
                      icon: Icon(
                        PRODUCT_BARCODE_ICON,
                      ),
                      onPressed: () {
                        // Open barcode scanner
                      },
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.width - 16,
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.camera),
                    iconSize: 256,
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: this.descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'descrição é obrigatória';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'descrição',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: this.brandController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'marca',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: this.packingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'embalagem é obrigatória';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'embalagem',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: this.weightController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'peso é obrigatório';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'peso (kg)',
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItem: true,
                        items: this.unities,
                        label: "unidade",
                        onChanged: (String? value) => this.unit = value!,
                        selectedItem: this.unit,
                      ),
                    ),
                  ),
                ],
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
                    title: Text('Excluir produto'),
                    content:
                        Text('Tem certeza que deseja excluir esse produto?'),
                    actions: [
                      TextButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(dialogContext).pop(),
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () {
                          controller
                              .delete(this.productModel.id!)
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
                if (this._editForm.currentState!.validate()) {
                  controller
                      .save(
                        ProductModel(
                          id: this.productModel.id,
                          barcode: this.barcodeController.text,
                          description: this.descriptionController.text,
                          brand: this.brandController.text,
                          packing: this.packingController.text,
                          weight:
                              double.tryParse(this.weightController.text) ?? 0,
                          unit: this.unit,
                          createdAt: this.productModel.createdAt,
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
