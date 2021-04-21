import 'package:myshoplist/app/modules/home/repositories/shoplist_item_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/constants/shoplist_constants.dart';
import 'package:myshoplist/app/database/database_helper.dart';
import 'package:myshoplist/app/modules/home/models/shoplist_model.dart';
import 'package:myshoplist/app/modules/home/repositories/interfaces/shoplist_repository_interface.dart';

class ShoplistRepository extends Disposable implements IShoplistRepository {
  Future<Database> _database() => DatabaseHelper.instance.database;

  @override
  Future<List<ShoplistModel>> getAll() async {
    final Database db = await _database();
    try {
      final shoplists = await db.query(SHOPLIST_TABLE);
      return List.generate(
        shoplists.length,
        (index) {
          return ShoplistModel(
              id: shoplists[index][SHOPLIST_COLUMN_ID] as int,
              name: shoplists[index][SHOPLIST_COLUMN_NAME] as String,
              createDate: DateTime.tryParse(
                  shoplists[index][SHOPLIST_COLUMN_CREATE_DATE].toString()),
              updateDate: DateTime.tryParse(
                  shoplists[index][SHOPLIST_COLUMN_UPDATE_DATE].toString()),
              items: []);
        },
      );
    } catch (error) {
      print(error);
    }

    return [];
  }

  @override
  Future<ShoplistModel> getById(int id) async {
    final Database db = await _database();

    try {
      List<Map<String, dynamic>> shoplist = await db.query(SHOPLIST_TABLE,
          columns: [
            SHOPLIST_COLUMN_ID,
            SHOPLIST_COLUMN_NAME,
            SHOPLIST_COLUMN_CREATE_DATE,
            SHOPLIST_COLUMN_UPDATE_DATE,
          ],
          where: '$SHOPLIST_COLUMN_ID = ?',
          whereArgs: [id],
          limit: 1);
      if (shoplist.isNotEmpty) {
        shoplist.first['items'] = await ShopListItemRepository().getAll(id);
        return ShoplistModel.readData(shoplist.first);
      }
    } catch (error) {
      print(error);
    }

    return [].first;
  }

  @override
  Future<int> getCount() async {
    final Database db = await _database();

    try {
      return Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM $SHOPLIST_TABLE'))!;
    } catch (error) {
      print(error);
    }

    return 0;
  }

  @override
  Future<int?> insert(ShoplistModel shoplistModel) async {
    final Database db = await _database();

    try {
      return await db.insert(SHOPLIST_TABLE, shoplistModel.writeData());
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> update(ShoplistModel shoplistModel) async {
    final Database db = await _database();

    try {
      return await db.update(
        SHOPLIST_TABLE,
        shoplistModel.writeData(),
        where: '$SHOPLIST_COLUMN_ID = ?',
        whereArgs: [shoplistModel.id],
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
        SHOPLIST_TABLE,
        where: '$SHOPLIST_COLUMN_ID = ?',
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
