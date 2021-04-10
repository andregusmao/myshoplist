import 'package:myshoplist/app/constants/shoplist_constants.dart';

class ShoplistModel {
  final int id;
  final String name;
  final DateTime createDate;
  final DateTime updateDate;

  ShoplistModel({
    required this.id,
    required this.name,
    required this.createDate,
    required this.updateDate,
  });

  static ShoplistModel fromMap(Map<String, dynamic> data) {
    return ShoplistModel(
      id: data[SHOPLIST_COLUMN_ID],
      name: data[SHOPLIST_COLUMN_NAME],
      createDate: data[SHOPLIST_COLUMN_CREATE_DATE],
      updateDate: data[SHOPLIST_COLUMN_UPDATE_DATE],
    );
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map[SHOPLIST_COLUMN_ID] = this.id;
    map[SHOPLIST_COLUMN_NAME] = this.name;
    map[SHOPLIST_COLUMN_CREATE_DATE] = this.createDate;
    map[SHOPLIST_COLUMN_UPDATE_DATE] = this.updateDate;

    return map;
  }
}
