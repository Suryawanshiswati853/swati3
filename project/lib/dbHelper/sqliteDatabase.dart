import 'package:path/path.dart';
import 'package:project/Model/Employees.dart';
import 'package:sqflite/sqflite.dart';

// class sqliteDatabase{



class DatabaseHelper {
  
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  
  static Database? _database; // Make it nullable

  DatabaseHelper._privateConstructor();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'C:/Users/HP/Desktop/Database/mydatabase.db');
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Employees(
        EmpId INTEGER PRIMARY KEY AUTOINCREMENT,
        EmpName TEXT,
        Age INTEGER,
        Salary REAL
      )
    ''');
  }
  Future<int> insertEmployee(Employee employee) async {
  final db = await database;
  return await db.transaction((txn) async {
    return await txn.insert('Employees', employee.toMap(excludeId: true));
  });
}


//   Future<int> insertEmployee(Employee employee) async {
//     final db = await database;
//     return await db.insert('Employees', employee.toMap(excludeId: true));
//   }
//   Future<List<Employee>> getAllEmployees() async {
//   final db = await database;
//   final List<Map<String, dynamic>> maps = await db.query('Employees');
//   return List.generate(maps.length, (i) {
//     return Employee(
//       EmpId: maps[i]['EmpId'],
//       EmpName: maps[i]['EmpName'],
//       Age: maps[i]['Age'],
//       Salary: maps[i]['Salary'],
//     );
//   });
// }


  Future<List<Employee>> getAllEmployees() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Employees');
    return List.generate(maps.length, (i) {
      return Employee.fromMap(maps[i]);
    });
  }
}
