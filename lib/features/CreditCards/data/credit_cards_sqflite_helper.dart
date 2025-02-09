import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CreditCardsSqfliteHelper {
  static Database? _database;

  static Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'credit_card.sql'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cards(
            id TEXT PRIMARY KEY,
            userId TEXT,  -- Store the logged-in user's unique ID
            cardType TEXT,
            last4 TEXT,
            cardholderName TEXT,
            expiryDate TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  static Future<void> insertCard(
      {required String userId, required Map<String, dynamic> cardData}) async {
    final db = await database;
    await db.insert(
      'cards',
      {'userId': userId, ...cardData},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getCards(
      {required String userId}) async {
    final db = await database;
    return db.query(
      'cards',
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }

  static Future<void> deleteCard(
      {required String userId, required String cardId}) async {
    final db = await database;
    await db.delete(
      'cards',
      where: 'id = ? AND userId = ?',
      whereArgs: [cardId, userId],
    );
  }

  static Future<void> resetDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
