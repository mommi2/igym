import 'package:igym/models/exercise.dart';
import 'package:igym/repositories/base_repository.dart';
import 'package:igym/repositories/dbhelper.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseRepository implements BaseRepository<int, Exercise> {

  final DbHelper _dbHelper = DbHelper.instance;

  @override
  Future<Exercise> insert(Exercise model) async {
    Database db = await _dbHelper.database;
    int id = await db.insert(exerciseTable, model.toJson());
    return model.copy(id: id);
  }

  @override
  Future<void> delete(int id) async {
    Database db = await _dbHelper.database;
    await db.delete(
        exerciseTable,
        where: '${ExerciseFields.id} = ?',
        whereArgs: [id]
    );
  }

  @override
  Future<int> update(Exercise model) async {
    Database db = await _dbHelper.database;
    return await db.update(
        exerciseTable,
        model.toJson(),
        where: '${ExerciseFields.id} = ?',
        whereArgs: [model.id]
    );
  }

  @override
  Future<List<Exercise>> findAll() async {
    Database db = await _dbHelper.database;
    List<Map<String, dynamic>> result = await db.query(exerciseTable);
    return result.map((value) => Exercise.fromJson(value)).toList();
  }

  Future<List<Exercise>> findByWorkoutId(int workoutId) async {
    Database db = await _dbHelper.database;
    List<Map<String, dynamic>> result = await db.query(
        exerciseTable,
        where: '${ExerciseFields.workoutId} = ?',
        whereArgs: [workoutId]
    );
    return result.map((value) => Exercise.fromJson(value)).toList();
  }

}