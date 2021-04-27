import 'package:intl/intl.dart';
import 'package:myshoplist/constants/shoplist_constants.dart';
import 'package:myshoplist/models/shoplist_item_model.dart';

class ShoplistModel {
  final int? id;
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<ShoplistItemModel>? items;

  ShoplistModel({
    this.id,
    required this.name,
    required this.createdAt,
    this.updatedAt,
    this.items,
  });

  static ShoplistModel readData(Map<String, dynamic> data) {
    return ShoplistModel(
        id: data[SHOPLIST_COLUMN_ID],
        name: data[SHOPLIST_COLUMN_NAME],
        createdAt: data[SHOPLIST_COLUMN_CREATE_DATE],
        updatedAt: data[SHOPLIST_COLUMN_UPDATE_DATE],
        items: data['items']);
  }

  Map<String, dynamic> writeData() {
    final data = Map<String, dynamic>();

    data[SHOPLIST_COLUMN_ID] = this.id;
    data[SHOPLIST_COLUMN_NAME] = this.name;
    if (this.id == null) {
      data[SHOPLIST_COLUMN_CREATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    } else {
      data[SHOPLIST_COLUMN_UPDATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    }

    return data;
  }
}
