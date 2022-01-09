import 'package:igym/models/exercise.dart';

final String workoutTable = 'WORKOUT';

enum WorkoutType {
  multifrequency,
  monofrequency
}

class WorkoutFields {
  static final String id = 'ID';
  static final String typeIndex = 'TYPE_INDEX';
  static final String name = 'NAME';
}

class Workout {
  int? id;
  WorkoutType type;
  String name;

  Workout({
    this.id,
    required this.type,
    required this.name
  });

  Map<String, dynamic> toJson() => {
    WorkoutFields.id: id,
    WorkoutFields.typeIndex: type.index,
    WorkoutFields.name: name
  };

  Workout.fromJson(Map<String, dynamic> json)
      : id = json[WorkoutFields.id],
        type = WorkoutType.values[json[WorkoutFields.typeIndex]],
        name = json[WorkoutFields.name];

  Workout copy({
    int? id,
    WorkoutType? type,
    String? name,
  }) {
    return Workout(
        id: id ?? this.id,
        type: type ?? this.type,
        name: name ?? this.name
    );
  }
}