import 'package:sqflite/sqflite.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/constants/purchase_constants.dart';
import 'package:myshoplist/app/database/database_helper.dart';
import 'package:myshoplist/app/modules/home/models/purchase_model.dart';
import 'package:myshoplist/app/modules/home/repositories/interfaces/purchase_repository_interface.dart';

class PurchaseRepository extends Disposable implements IPurchaseRepository {
  Future<Database> _database() => DatabaseHelper.instance.database;

  @override
  Future<List<PurchaseModel>?> getAll() async {
    final Database db = await _database();
    try {
      final purchases = await db.query(PURCHASE_TABLE);
      return List.generate(
        purchases.length,
        (index) {
          return PurchaseModel(
            id: purchases[index][PURCHASE_COLUMN_ID] as int,
            shoplistId: purchases[index][PURCHASE_COLUMN_SHOPLIST_ID] as int,
            marketplaceId:
                purchases[index][PURCHASE_COLUMN_MARKETPLACE_ID] as int,
            startDate: purchases[index][PURCHASE_COLUMN_START_DATE] as DateTime,
            finishDate:
                purchases[index][PURCHASE_COLUMN_FINISH_DATE] as DateTime,
          );
        },
      );
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<PurchaseModel?> getById(int id) async {
    final Database db = await _database();

    try {
      List<Map<String, dynamic>> purchase = await db.query(
        PURCHASE_TABLE,
        columns: [
          PURCHASE_COLUMN_ID,
          PURCHASE_COLUMN_SHOPLIST_ID,
          PURCHASE_COLUMN_MARKETPLACE_ID,
          PURCHASE_COLUMN_START_DATE,
          PURCHASE_COLUMN_FINISH_DATE,
        ],
        where: '$PURCHASE_COLUMN_ID = ?',
        whereArgs: [id],
      );
      if (purchase.isNotEmpty) {
        return PurchaseModel.fromMap(purchase.first);
      }
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> getCount() async {
    final Database db = await _database();

    try {
      return Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM $PURCHASE_TABLE'))!;
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> insert(PurchaseModel purchaseModel) async {
    final Database db = await _database();

    try {
      return await db.insert(PURCHASE_TABLE, purchaseModel.toMap());
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> update(PurchaseModel purchaseModel) async {
    final Database db = await _database();

    try {
      return await db.update(
        PURCHASE_TABLE,
        purchaseModel.toMap(),
        where: '$PURCHASE_COLUMN_ID = ?',
        whereArgs: [purchaseModel.id],
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
        PURCHASE_TABLE,
        where: '$PURCHASE_COLUMN_ID = ?',
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
