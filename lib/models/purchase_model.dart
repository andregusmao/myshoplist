import 'package:myshoplist/constants/purchase_constants.dart';
import 'package:myshoplist/models/marketplace_model.dart';
import 'package:myshoplist/models/purchase_item_model.dart';
import 'package:myshoplist/models/shoplist_model.dart';

class PurchaseModel {
  final int? id;
  final int shoplistId;
  final int marketplaceId;
  final DateTime? startDate;
  final DateTime? finishDate;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<PurchaseItemModel> items;
  final ShoplistModel shoplist;
  final MarketplaceModel marketplace;

  PurchaseModel({
    this.id,
    required this.shoplistId,
    required this.marketplaceId,
    this.startDate,
    this.finishDate,
    required this.createdAt,
    this.updatedAt,
    required this.items,
    required this.shoplist,
    required this.marketplace,
  });

  static PurchaseModel readData(Map<String, dynamic> data) {
    return PurchaseModel(
      id: data[PURCHASE_COLUMN_ID],
      shoplistId: data[PURCHASE_COLUMN_SHOPLIST_ID],
      marketplaceId: data[PURCHASE_COLUMN_MARKETPLACE_ID],
      startDate: data[PURCHASE_COLUMN_START_DATE],
      finishDate: data[PURCHASE_COLUMN_FINISH_DATE],
      createdAt: data[PURCHASE_COLUMN_CREATE_DATE],
      updatedAt: data[PURCHASE_COLUMN_UPDATE_DATE],
      items: data['items'],
      shoplist: data['shoplist'],
      marketplace: data['marketplace'],
    );
  }

  Map<String, dynamic> writeData() {
    final data = Map<String, dynamic>();

    data[PURCHASE_COLUMN_ID] = this.id;
    data[PURCHASE_COLUMN_SHOPLIST_ID] = this.shoplistId;
    data[PURCHASE_COLUMN_MARKETPLACE_ID] = this.marketplaceId;
    data[PURCHASE_COLUMN_START_DATE] = this.startDate;
    data[PURCHASE_COLUMN_FINISH_DATE] = this.finishDate;

    return data;
  }
}
