import 'package:igym/models/workout.dart';
import 'package:igym/repositories/workout_repository.dart';
import 'package:igym/services/base_service.dart';

class WorkoutService implements BaseService<int, Workout> {

  late WorkoutRepository _workoutRepository;

  WorkoutService() {
    _workoutRepository = WorkoutRepository();
  }

  @override
  Future<void> delete(int id) async {
    _workoutRepository.delete(id);
  }

  @override
  Future<List<Workout>> findAll() async {
    return await _workoutRepository.findAll();
  }

  @override
  Future<Workout> insert(Workout model) async {
    return await _workoutRepository.insert(model);
  }

  @override
  Future<int> update(Workout model) async {
    return await _workoutRepository.update(model);
  }



}