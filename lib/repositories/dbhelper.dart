import 'package:igym/models/exercise.dart';
import 'package:igym/models/workout.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  static final DbHelper instance = DbHelper._init();

  static final String _dbFileName = 'igym.db';

  static Database? _database;

  DbHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    print('File $_dbFileName non trovato');
    _database = await _initDB(_dbFileName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    print('Preparazione $_dbFileName in corso...');
    String dbPath = await getDatabasesPath();
    String fullPath = join(dbPath, filePath);
    return await openDatabase(fullPath, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    print('Creazione tabelle...');
    await db.execute('''
      CREATE TABLE $workoutTable (
        ${WorkoutFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${WorkoutFields.typeIndex} INTEGER NOT NULL,
        ${WorkoutFields.name} TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE $exerciseTable (
        ${ExerciseFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ExerciseFields.description} TEXT NOT NULL,
        ${ExerciseFields.repetitions} INTEGER NOT NULL,
        ${ExerciseFields.muscleGroupIndex} INTEGER NOT NULL,
        ${ExerciseFields.workoutId} INTEGER NOT NULL,
        FOREIGN KEY (${ExerciseFields.workoutId}) REFERENCES $workoutTable (${WorkoutFields.id}) 
          ON DELETE CASCADE ON UPDATE NO ACTION
      )
    ''');
    print('$_dbFileName completato');
  }

  Future close() async {
    Database db = await instance.database;
    db.close();
    print('$_dbFileName connessione chiusa');
  }
}