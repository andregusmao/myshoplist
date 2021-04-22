import 'package:myshoplist/constants/shoplist_item_constants.dart';

class ShoplistItemModel {
  final int? id;
  final int shoplistId;
  final int productId;
  final double quantity;
  final DateTime? createDate;
  final DateTime? updateDate;

  ShoplistItemModel({
    this.id,
    required this.shoplistId,
    required this.productId,
    required this.quantity,
    this.createDate,
    this.updateDate,
  });

  static ShoplistItemModel fromMap(Map<String, dynamic> data) {
    return ShoplistItemModel(
      id: data[SHOPLIST_ITEM_COLUMN_ID],
      shoplistId: data[SHOPLIST_ITEM_COLUMN_SHOPLIST_ID],
      productId: data[SHOPLIST_ITEM_COLUMN_PRODUCT_ID],
      quantity: data[SHOPLIST_ITEM_COLUMN_QUANTITY],
      createDate: data[SHOPLIST_ITEM_COLUMN_CREATE_DATE],
      updateDate: data[SHOPLIST_ITEM_COLUMN_UPDATE_DATE],
    );
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map[SHOPLIST_ITEM_COLUMN_ID] = this.id;
    map[SHOPLIST_ITEM_COLUMN_SHOPLIST_ID] = this.shoplistId;
    map[SHOPLIST_ITEM_COLUMN_PRODUCT_ID] = this.productId;
    map[SHOPLIST_ITEM_COLUMN_QUANTITY] = this.quantity;
    map[SHOPLIST_ITEM_COLUMN_CREATE_DATE] = this.createDate;
    map[SHOPLIST_ITEM_COLUMN_UPDATE_DATE] = this.updateDate;

    return map;
  }
}
