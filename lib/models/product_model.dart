import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:myshoplist/constants/product_constants.dart';

class ProductModel {
  final int? id;
  final String barcode;
  final String description;
  final String? brand;
  final String unit;
  final double? weight;
  final ByteBuffer? image;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ProductModel({
    this.id,
    required this.barcode,
    required this.description,
    this.brand,
    required this.unit,
    this.weight,
    this.image,
    required this.createdAt,
    this.updatedAt,
  });

  static ProductModel fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data[PRODUCT_COLUMN_ID],
      barcode: data[PRODUCT_COLUMN_BARCODE],
      description: data[PRODUCT_COLUMN_DESCRIPTION],
      brand: data[PRODUCT_COLUMN_BRAND],
      unit: data[PRODUCT_COLUMN_UNIT],
      weight: data[PRODUCT_COLUMN_WEIGHT],
      image: data[PRODUCT_COLUMN_IMAGE],
      createdAt: data[PRODUCT_COLUMN_CREATE_DATE],
      updatedAt: data[PRODUCT_COLUMN_UPDATE_DATE],
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
    map[PRODUCT_COLUMN_IMAGE] = this.image;
    if (this.id == null) {
      map[PRODUCT_COLUMN_CREATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    } else {
      map[PRODUCT_COLUMN_UPDATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    }

    return map;
  }
}
