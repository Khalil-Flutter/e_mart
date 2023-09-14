import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../model/e_mart_product_model.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();
  Database? db;

  final String dbName = "mart.db";
  final String tableName = "product";
  final String colId = "id";
  final String colName = "name";
  final String colPrice = "price";
  final String colQuantity = "quantity";
  final String colLike = "like";
  final String colImage = "image";

  Future<void> initDB() async {
    var directoryPath = await getDatabasesPath();
    String path = join(directoryPath, dbName);
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          String query =
              "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT ,$colName TEXT,$colPrice NUMERIC ,$colImage TEXT,$colQuantity INTEGER,$colLike TEXT)";
          await db.execute(query);
        });
  }

  Future<int?> insertRecord({required Product data}) async {
    await initDB();
    String query =
        "INSERT INTO $tableName($colName,$colPrice,$colImage,$colQuantity,$colLike)VALUES(?,?,?,?,?)";
    List args = [
      data.name,
      data.price,
      data.image,
      data.quantity,
      data.like,
    ];
    int? id = await db?.rawInsert(query, args);
    return id;
  }

  Future<List<Product>> fetchAllRecord() async {
    await initDB();
    String query = "SELECT * FROM $tableName";
    List<Map<String, dynamic>> data = await db!.rawQuery(query);
    List<Product> allProduct =
    data.map((e) => Product.fromMap(data: e)).toList();
    return allProduct;
  }

  Future<int> deleteRecord({required int id}) async {
    await initDB();
    String query = "DELETE FROM $tableName WHERE $colId=?";
    List args = [id];

    return db!.rawDelete(query, args);
  }

  Future<int> updateRecord({required Product data, required int id}) async {
    await initDB();
    String query =
        "UPDATE $tableName SET $colName=?, $colPrice=?, $colImage=?, $colQuantity=? ,$colLike=? WHERE $colId=?";
    List args = [
      data.name,
      data.price,
      data.image,
      data.quantity,
      data.like,
      id
    ];
    return await db!.rawUpdate(query, args);
  }
  Future<List<Product>> fetchSearchedRecord({required String data}) async {
    await initDB();

    String query = "SELECT * FROM $tableName WHERE $colName LIKE '%$data%'";

    List<Map<String, dynamic>> productData = await db!.rawQuery(query);

    List<Product> allProduct =
    productData.map((e) => Product.fromMap(data: e)).toList();

    return allProduct;
  }
}
