import 'package:myshoplist/app/constants/purchase_item_constants.dart';

class PurchaseItemModel {
  final int id;
  final int purchaseId;
  final int productId;
  final double quantity;
  final double unitPrice;
  final DateTime createDate;
  final DateTime updateDate;

  PurchaseItemModel({
    required this.id,
    required this.purchaseId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.createDate,
    required this.updateDate,
  });

  static PurchaseItemModel fromMap(Map<String, dynamic> data) {
    return PurchaseItemModel(
      id: data[PURCHASE_ITEM_COLUMN_ID],
      purchaseId: data[PURCHASE_ITEM_COLUMN_PURCHASE_ID],
      productId: data[PURCHASE_ITEM_COLUMN_PRODUCT_ID],
      quantity: data[PURCHASE_ITEM_COLUMN_QUANTITY],
      unitPrice: data[PURCHASE_ITEM_COLUMN_UNIT_PRICE],
      createDate: data[PURCHASE_ITEM_COLUMN_CREATE_DATE],
      updateDate: data[PURCHASE_ITEM_COLUMN_UPDATE_DATE],
    );
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map[PURCHASE_ITEM_COLUMN_ID] = this.id;
    map[PURCHASE_ITEM_COLUMN_PURCHASE_ID] = this.purchaseId;
    map[PURCHASE_ITEM_COLUMN_PRODUCT_ID] = this.productId;
    map[PURCHASE_ITEM_COLUMN_QUANTITY] = this.quantity;
    map[PURCHASE_ITEM_COLUMN_UNIT_PRICE] = this.unitPrice;
    map[PURCHASE_ITEM_COLUMN_CREATE_DATE] = this.createDate;
    map[PURCHASE_ITEM_COLUMN_UPDATE_DATE] = this.updateDate;

    return map;
  }
}
