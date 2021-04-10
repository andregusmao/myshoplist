import 'package:sqflite/sqflite.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/app/constants/product_constants.dart';
import 'package:myshoplist/app/database/database_helper.dart';
import 'package:myshoplist/app/modules/home/models/product_model.dart';
import 'package:myshoplist/app/modules/home/repositories/interfaces/product_repository_interface.dart';

class ProductRepository extends Disposable implements IProductRepository {
  Future<Database> _database() => DatabaseHelper.instance.database;

  @override
  Future<List<ProductModel>?> getAll() async {
    final Database db = await _database();

    try {
      final products = await db.query(PRODUCT_TABLE);
      return List.generate(
        products.length,
        (index) {
          return ProductModel(
            id: products[index][PRODUCT_COLUMN_ID] as int,
            barcode: products[index][PRODUCT_COLUMN_BARCODE] as String,
            description: products[index][PRODUCT_COLUMN_DESCRIPTION] as String,
            brand: products[index][PRODUCT_COLUMN_BRAND] as String,
            unit: products[index][PRODUCT_COLUMN_UNIT] as String,
            weight: products[index][PRODUCT_COLUMN_WEIGHT] as double,
            createDate: products[index][PRODUCT_COLUMN_CREATE_DATE] as DateTime,
            updateDate: products[index][PRODUCT_COLUMN_UPDATE_DATE] as DateTime,
          );
        },
      );
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<ProductModel?> getById(int id) async {
    final Database db = await _database();

    try {
      List<Map<String, dynamic>> product = await db.query(
        PRODUCT_TABLE,
        columns: [
          PRODUCT_COLUMN_ID,
          PRODUCT_COLUMN_BARCODE,
          PRODUCT_COLUMN_DESCRIPTION,
          PRODUCT_COLUMN_BRAND,
          PRODUCT_COLUMN_UNIT,
          PRODUCT_COLUMN_WEIGHT,
          PRODUCT_COLUMN_CREATE_DATE,
          PRODUCT_COLUMN_UPDATE_DATE,
        ],
        where: '$PRODUCT_COLUMN_ID = ?',
        whereArgs: [id],
      );
      if (product.isNotEmpty) {
        return ProductModel.fromMap(product.first);
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
          await db.rawQuery('SELECT COUNT(*) FROM $PRODUCT_TABLE'))!;
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> insert(ProductModel productModel) async {
    final Database db = await _database();

    try {
      return await db.insert(PRODUCT_TABLE, productModel.toMap());
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> update(ProductModel productModel) async {
    final Database db = await _database();

    try {
      return await db.update(
        PRODUCT_TABLE,
        productModel.toMap(),
        where: '$PRODUCT_COLUMN_ID = ?',
        whereArgs: [productModel.id],
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
        PRODUCT_TABLE,
        where: '$PRODUCT_COLUMN_ID = ?',
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
