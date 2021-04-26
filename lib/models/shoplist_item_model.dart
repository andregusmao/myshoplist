import 'package:myshoplist/constants/shoplist_item_constants.dart';
import 'package:myshoplist/models/product_model.dart';
import 'package:myshoplist/models/shoplist_model.dart';

class ShoplistItemModel {
  final int? id;
  final int shoplistId;
  final int productId;
  final double quantity;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final ShoplistModel shoplist;
  final ProductModel product;

  ShoplistItemModel({
    this.id,
    required this.shoplistId,
    required this.productId,
    required this.quantity,
    required this.createdAt,
    this.updatedAt,
    required this.shoplist,
    required this.product,
  });

  static ShoplistItemModel fromMap(Map<String, dynamic> data) {
    return ShoplistItemModel(
      id: data[SHOPLIST_ITEM_COLUMN_ID],
      shoplistId: data[SHOPLIST_ITEM_COLUMN_SHOPLIST_ID],
      productId: data[SHOPLIST_ITEM_COLUMN_PRODUCT_ID],
      quantity: data[SHOPLIST_ITEM_COLUMN_QUANTITY],
      createdAt: data[SHOPLIST_ITEM_COLUMN_CREATE_DATE],
      updatedAt: data[SHOPLIST_ITEM_COLUMN_UPDATE_DATE],
      shoplist: data['shoplist'],
      product: data['product'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map[SHOPLIST_ITEM_COLUMN_ID] = this.id;
    map[SHOPLIST_ITEM_COLUMN_SHOPLIST_ID] = this.shoplistId;
    map[SHOPLIST_ITEM_COLUMN_PRODUCT_ID] = this.productId;
    map[SHOPLIST_ITEM_COLUMN_QUANTITY] = this.quantity;
    map[SHOPLIST_ITEM_COLUMN_CREATE_DATE] = this.createdAt;
    map[SHOPLIST_ITEM_COLUMN_UPDATE_DATE] = this.updatedAt;

    return map;
  }
}
