import 'package:myshoplist/app/constants/product_constants.dart';

class ProductModel {
  final int id;
  final String barcode;
  final String description;
  final String brand;
  final String unit;
  final double weight;
  final DateTime createDate;
  final DateTime updateDate;

  ProductModel({
    required this.id,
    required this.barcode,
    required this.description,
    required this.brand,
    required this.unit,
    required this.weight,
    required this.createDate,
    required this.updateDate,
  });

  static ProductModel fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data[PRODUCT_COLUMN_ID],
      barcode: data[PRODUCT_COLUMN_BARCODE],
      description: data[PRODUCT_COLUMN_DESCRIPTION],
      brand: data[PRODUCT_COLUMN_BRAND],
      unit: data[PRODUCT_COLUMN_UNIT],
      weight: data[PRODUCT_COLUMN_WEIGHT],
      createDate: data[PRODUCT_COLUMN_CREATE_DATE],
      updateDate: data[PRODUCT_COLUMN_UPDATE_DATE],
    );
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map[PRODUCT_COLUMN_ID] = this.id;
    map[PRODUCT_COLUMN_BARCODE] = this.barcode;
    map[PRODUCT_COLUMN_DESCRIPTION] = this.description;
    map[PRODUCT_COLUMN_BRAND] = this.brand;
    map[PRODUCT_COLUMN_UNIT] = this.unit;
    map[PRODUCT_COLUMN_WEIGHT] = this.weight;
    map[PRODUCT_COLUMN_CREATE_DATE] = this.createDate;
    map[PRODUCT_COLUMN_UPDATE_DATE] = this.updateDate;

    return map;
  }
}
