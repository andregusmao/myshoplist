import 'package:sqflite/sqflite.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/constants/product_constants.dart';
import 'package:myshoplist/database/database_helper.dart';
import 'package:myshoplist/models/product_model.dart';
import 'package:myshoplist/repositories/interfaces/product_repository_interface.dart';

class ProductRepository extends Disposable implements IProductRepository {
  Future<Database> _database() => DatabaseHelper.instance.database;

  @override
  Future<List<ProductModel>> getAll() async {
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
            brand: products[index][PRODUCT_COLUMN_BRAND] as String?,
            packing: products[index][PRODUCT_COLUMN_PACKING] as String,
            weight: products[index][PRODUCT_COLUMN_WEIGHT] as double,
            unit: products[index][PRODUCT_COLUMN_UNIT] as String,
            createdAt: DateTime.parse(
                products[index][PRODUCT_COLUMN_CREATE_DATE].toString()),
            updatedAt: DateTime.tryParse(
                products[index][PRODUCT_COLUMN_UPDATE_DATE].toString()),
          );
        },
      );
    } catch (error) {
      print(error);
    }

    return [];
  }

  @override
  Future<ProductModel> getById(int id) async {
    final Database db = await _database();

    try {
      List<Map<String, dynamic>> product = await db.query(
        PRODUCT_TABLE,
        columns: [
          PRODUCT_COLUMN_ID,
          PRODUCT_COLUMN_BARCODE,
          PRODUCT_COLUMN_DESCRIPTION,
          PRODUCT_COLUMN_BRAND,
          PRODUCT_COLUMN_PACKING,
          PRODUCT_COLUMN_WEIGHT,
          PRODUCT_COLUMN_UNIT,
          PRODUCT_COLUMN_CREATE_DATE,
          PRODUCT_COLUMN_UPDATE_DATE,
        ],
        where: '$PRODUCT_COLUMN_ID = ?',
        whereArgs: [id],
      );
      if (product.isNotEmpty) {
        return ProductModel.readData(product.first);
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
          await db.rawQuery('SELECT COUNT(*) FROM $PRODUCT_TABLE'))!;
    } catch (error) {
      print(error);
    }

    return 0;
  }

  @override
  Future<int?> insert(ProductModel productModel) async {
    final Database db = await _database();

    try {
      return await db.insert(PRODUCT_TABLE, productModel.writeData());
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
        productModel.writeData(),
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
