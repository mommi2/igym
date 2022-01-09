import 'package:igym/models/workout.dart';
import 'package:igym/repositories/base_repository.dart';
import 'package:igym/repositories/dbhelper.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseRepository implements BaseRepository<int, Workout> {

  final DbHelper _dbHelper = DbHelper.instance;

  @override
  Future<Workout> insert(Workout model) async {
    Database db = await _dbHelper.database;
    int id = await db.insert(workoutTable, model.toJson());
    return model.copy(id: id);
  }

  @override
  void delete(int id) async {
    Database db = await _dbHelper.database;
    await db.delete(
        workoutTable,
        where: '${WorkoutFields.id} = ?',
        whereArgs: [id]
    );
  }

  @override
  Future<int> update(Workout model) async {
    Database db = await _dbHelper.database;
    return await db.update(
        workoutTable,
        model.toJson(),
        where: '${WorkoutFields.id} = ?',
        whereArgs: [model.id]
    );
  }

  @override
  Future<List<Workout>> findAll() async {
    Database db = await _dbHelper.database;
    List<Map<String, dynamic>> result = await db.query(workoutTable);
    return result.map((value) => Workout.fromJson(value)).toList();
  }
}