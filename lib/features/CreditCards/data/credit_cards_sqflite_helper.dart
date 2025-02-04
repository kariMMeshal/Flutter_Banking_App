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
      join(dbPath, 'credit_card.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cards(
            id TEXT PRIMARY KEY,
            cardType TEXT,
            last4 TEXT,
            cardholderName TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  static Future<void> insertCard(Map<String, dynamic> cardData) async {
    final db = await database;
    await db.insert(
      'cards',
      cardData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getCards() async {
    final db = await database;
    return db.query('cards');
  }

  static Future<void> deleteCard(String id) async {
    final db = await database;
    await db.delete(
      'cards',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
