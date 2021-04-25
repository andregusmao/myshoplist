import 'package:sqflite/sqflite.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/constants/shoplist_item_constants.dart';
import 'package:myshoplist/database/database_helper.dart';
import 'package:myshoplist/models/shoplist_item_model.dart';
import 'package:myshoplist/repositories/interfaces/shoplist_item_repository_interface.dart';

class ShopListItemRepository extends Disposable
    implements IShoplistItemRepository {
  Future<Database> _database() => DatabaseHelper.instance.database;

  @override
  Future<List<ShoplistItemModel>> getAll(int shoplistId) async {
    final Database db = await _database();
    try {
      final shoplistItems = await db.query(
        SHOPLIST_ITEM_TABLE,
        where: '$SHOPLIST_ITEM_COLUMN_SHOPLIST_ID = ?',
        whereArgs: [shoplistId],
      );
      return List.generate(
        shoplistItems.length,
        (index) {
          return ShoplistItemModel(
            id: shoplistItems[index][SHOPLIST_ITEM_COLUMN_ID] as int,
            shoplistId:
                shoplistItems[index][SHOPLIST_ITEM_COLUMN_SHOPLIST_ID] as int,
            productId:
                shoplistItems[index][SHOPLIST_ITEM_COLUMN_PRODUCT_ID] as int,
            quantity:
                shoplistItems[index][SHOPLIST_ITEM_COLUMN_QUANTITY] as double,
            createDate: shoplistItems[index][SHOPLIST_ITEM_COLUMN_CREATE_DATE]
                as DateTime,
            updateDate: shoplistItems[index][SHOPLIST_ITEM_COLUMN_UPDATE_DATE]
                as DateTime,
          );
        },
      );
    } catch (error) {
      print(error);
    }

    return [];
  }

  @override
  Future<ShoplistItemModel> getById(int id) async {
    final Database db = await _database();

    try {
      List<Map<String, dynamic>> shoplistItem = await db.query(
        SHOPLIST_ITEM_TABLE,
        columns: [
          SHOPLIST_ITEM_COLUMN_ID,
          SHOPLIST_ITEM_COLUMN_SHOPLIST_ID,
          SHOPLIST_ITEM_COLUMN_PRODUCT_ID,
          SHOPLIST_ITEM_COLUMN_QUANTITY,
          SHOPLIST_ITEM_COLUMN_CREATE_DATE,
          SHOPLIST_ITEM_COLUMN_UPDATE_DATE
        ],
        where: '$SHOPLIST_ITEM_COLUMN_ID = ?',
        whereArgs: [id],
      );
      if (shoplistItem.isNotEmpty) {
        return ShoplistItemModel.fromMap(shoplistItem.first);
      }
    } catch (error) {
      print(error);
    }

    return [].first;
  }

  @override
  Future<int> getCount(int shoplistId) async {
    final Database db = await _database();

    try {
      return Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM $SHOPLIST_ITEM_TABLE where $SHOPLIST_ITEM_COLUMN_SHOPLIST_ID = $shoplistId'))!;
    } catch (error) {
      print(error);
    }

    return 0;
  }

  @override
  Future<int?> insert(ShoplistItemModel shoplistItemModel) async {
    final Database db = await _database();

    try {
      return await db.insert(SHOPLIST_ITEM_TABLE, shoplistItemModel.toMap());
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> update(ShoplistItemModel shoplistItemModel) async {
    final Database db = await _database();

    try {
      return await db.update(
        SHOPLIST_ITEM_TABLE,
        shoplistItemModel.toMap(),
        where: '$SHOPLIST_ITEM_COLUMN_ID = ?',
        whereArgs: [shoplistItemModel.id],
      );
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> delete(int id) async {
    final Database db = await _database();

    try {
      return await db.delete(
        SHOPLIST_ITEM_TABLE,
        where: '$SHOPLIST_ITEM_COLUMN_ID = ?',
        whereArgs: [id],
      );
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  void dispose() {}
}
