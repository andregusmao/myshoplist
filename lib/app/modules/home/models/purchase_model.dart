import 'package:myshoplist/app/constants/purchase_constants.dart';

class PurchaseModel {
  final int id;
  final int shoplistId;
  final int marketplaceId;
  final DateTime startDate;
  final DateTime finishDate;

  PurchaseModel({
    required this.id,
    required this.shoplistId,
    required this.marketplaceId,
    required this.startDate,
    required this.finishDate,
  });

  static PurchaseModel fromMap(Map<String, dynamic> data) {
    return PurchaseModel(
      id: data[PURCHASE_COLUMN_ID],
      shoplistId: data[PURCHASE_COLUMN_SHOPLIST_ID],
      marketplaceId: data[PURCHASE_COLUMN_MARKETPLACE_ID],
      startDate: data[PURCHASE_COLUMN_START_DATE],
      finishDate: data[PURCHASE_COLUMN_FINISH_DATE],
    );
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map[PURCHASE_COLUMN_ID] = this.id;
    map[PURCHASE_COLUMN_SHOPLIST_ID] = this.shoplistId;
    map[PURCHASE_COLUMN_MARKETPLACE_ID] = this.marketplaceId;
    map[PURCHASE_COLUMN_START_DATE] = this.startDate;
    map[PURCHASE_COLUMN_FINISH_DATE] = this.finishDate;

    return map;
  }
}
