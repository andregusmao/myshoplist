import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:myshoplist/constants/product_constants.dart';

class ProductModel {
  final int? id;
  final String barcode;
  final String description;
  final String? brand;
  final String packing;
  final double weight;
  final String unit;
  final ByteBuffer? image;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ProductModel({
    this.id,
    required this.barcode,
    required this.description,
    this.brand,
    required this.packing,
    required this.weight,
    required this.unit,
    this.image,
    required this.createdAt,
    this.updatedAt,
  });

  static ProductModel readData(Map<String, dynamic> data) {
    return ProductModel(
      id: data[PRODUCT_COLUMN_ID],
      barcode: data[PRODUCT_COLUMN_BARCODE],
      description: data[PRODUCT_COLUMN_DESCRIPTION],
      brand: data[PRODUCT_COLUMN_BRAND],
      packing: data[PRODUCT_COLUMN_PACKING],
      weight: data[PRODUCT_COLUMN_WEIGHT],
      unit: data[PRODUCT_COLUMN_UNIT],
      image: data[PRODUCT_COLUMN_IMAGE],
      createdAt: data[PRODUCT_COLUMN_CREATE_DATE],
      updatedAt: data[PRODUCT_COLUMN_UPDATE_DATE],
    );
  }

  Map<String, dynamic> writeData() {
    final data = Map<String, dynamic>();

    data[PRODUCT_COLUMN_ID] = this.id;
    data[PRODUCT_COLUMN_BARCODE] = this.barcode;
    data[PRODUCT_COLUMN_DESCRIPTION] = this.description;
    data[PRODUCT_COLUMN_BRAND] = this.brand;
    data[PRODUCT_COLUMN_PACKING] = this.packing;
    data[PRODUCT_COLUMN_WEIGHT] = this.weight;
    data[PRODUCT_COLUMN_UNIT] = this.unit;
    data[PRODUCT_COLUMN_IMAGE] = this.image;
    if (this.id == null) {
      data[PRODUCT_COLUMN_CREATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    } else {
      data[PRODUCT_COLUMN_UPDATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    }

    return data;
  }
}
