import 'package:myshoplist/constants/purchase_item_constants.dart';
import 'package:myshoplist/models/product_model.dart';
import 'package:myshoplist/models/purchase_model.dart';

class PurchaseItemModel {
  final int? id;
  final int purchaseId;
  final int productId;
  final double quantity;
  final double unitPrice;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final PurchaseModel purchase;
  final ProductModel product;

  PurchaseItemModel({
    this.id,
    required this.purchaseId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.createdAt,
    this.updatedAt,
    required this.purchase,
    required this.product,
  });

  static PurchaseItemModel fromMap(Map<String, dynamic> data) {
    return PurchaseItemModel(
      id: data[PURCHASE_ITEM_COLUMN_ID],
      purchaseId: data[PURCHASE_ITEM_COLUMN_PURCHASE_ID],
      productId: data[PURCHASE_ITEM_COLUMN_PRODUCT_ID],
      quantity: data[PURCHASE_ITEM_COLUMN_QUANTITY],
      unitPrice: data[PURCHASE_ITEM_COLUMN_UNIT_PRICE],
      createdAt: data[PURCHASE_ITEM_COLUMN_CREATE_DATE],
      updatedAt: data[PURCHASE_ITEM_COLUMN_UPDATE_DATE],
      purchase: data['purchase'],
      product: data['product'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map[PURCHASE_ITEM_COLUMN_ID] = this.id;
    map[PURCHASE_ITEM_COLUMN_PURCHASE_ID] = this.purchaseId;
    map[PURCHASE_ITEM_COLUMN_PRODUCT_ID] = this.productId;
    map[PURCHASE_ITEM_COLUMN_QUANTITY] = this.quantity;
    map[PURCHASE_ITEM_COLUMN_UNIT_PRICE] = this.unitPrice;
    map[PURCHASE_ITEM_COLUMN_CREATE_DATE] = this.createdAt;
    map[PURCHASE_ITEM_COLUMN_UPDATE_DATE] = this.updatedAt;

    return map;
  }
}
