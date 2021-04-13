import 'package:intl/intl.dart';
import 'package:myshoplist/app/constants/shoplist_constants.dart';

class ShoplistModel {
  final int? id;
  final String name;
  final DateTime? createDate;
  final DateTime? updateDate;

  ShoplistModel({
    this.id,
    required this.name,
    this.createDate,
    this.updateDate,
  });

  static ShoplistModel readData(Map<String, dynamic> data) {
    return ShoplistModel(
      id: data[SHOPLIST_COLUMN_ID],
      name: data[SHOPLIST_COLUMN_NAME],
      createDate: data[SHOPLIST_COLUMN_CREATE_DATE],
      updateDate: data[SHOPLIST_COLUMN_UPDATE_DATE],
    );
  }

  Map<String, dynamic> writeData() {
    final map = Map<String, dynamic>();

    map[SHOPLIST_COLUMN_ID] = this.id;
    map[SHOPLIST_COLUMN_NAME] = this.name;
    if (this.id == null) {
      map[SHOPLIST_COLUMN_CREATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    } else {
      map[SHOPLIST_COLUMN_UPDATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    }

    return map;
  }
}
