import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_yemensofte/features/order_feature/data/model/order_model/order_model/delivery_bill.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'orders_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE orders(
        id TEXT PRIMARY KEY,
        billSrl TEXT,
        billNo TEXT,
        billDate TEXT,
        billTime TEXT,
        billAmt TEXT,
        taxAmt TEXT,
        dlvryAmt TEXT,
        mobileNo TEXT,
        cstmrNm TEXT,
        rgnNm TEXT,
        cstmrBuildNo TEXT,
        cstmrFloorNo TEXT,
        cstmrAprtmntNo TEXT,
        cstmrAddrss TEXT,
        latitude TEXT,
        longitude TEXT,
        dlvryStatusFlg TEXT,
        processedFlag TEXT
      )
    ''');
  }

  Future<void> insertOrder(DeliveryBill order, String processedFlag) async {
    final Database db = await database;
    await db.insert(
      'orders',
      {
        'id': order.billSrl,
        'billSrl': order.billSrl,
        'billNo': order.billNo,
        'billDate': order.billDate,
        'billTime': order.billTime,
        'billAmt': order.billAmt,
        'taxAmt': order.taxAmt,
        'dlvryAmt': order.dlvryAmt,
        'mobileNo': order.mobileNo,
        'cstmrNm': order.cstmrNm,
        'rgnNm': order.rgnNm,
        'cstmrBuildNo': order.cstmrBuildNo,
        'cstmrFloorNo': order.cstmrFloorNo,
        'cstmrAprtmntNo': order.cstmrAprtmntNo,
        'cstmrAddrss': order.cstmrAddrss,
        'latitude': order.latitude,
        'longitude': order.longitude,
        'dlvryStatusFlg': order.dlvryStatusFlg,
        'processedFlag': processedFlag
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<DeliveryBill>> getOrders(String processedFlag) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'orders',
      where: 'processedFlag = ?',
      whereArgs: [processedFlag],
    );

    return List.generate(maps.length, (i) {
      return DeliveryBill(
        billSrl: maps[i]['billSrl'],
        billNo: maps[i]['billNo'],
        billDate: maps[i]['billDate'],
        billTime: maps[i]['billTime'],
        billAmt: maps[i]['billAmt'],
        taxAmt: maps[i]['taxAmt'],
        dlvryAmt: maps[i]['dlvryAmt'],
        mobileNo: maps[i]['mobileNo'],
        cstmrNm: maps[i]['cstmrNm'],
        rgnNm: maps[i]['rgnNm'],
        cstmrBuildNo: maps[i]['cstmrBuildNo'],
        cstmrFloorNo: maps[i]['cstmrFloorNo'],
        cstmrAprtmntNo: maps[i]['cstmrAprtmntNo'],
        cstmrAddrss: maps[i]['cstmrAddrss'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
        dlvryStatusFlg: maps[i]['dlvryStatusFlg'],
      );
    });
  }
}
