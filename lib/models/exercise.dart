import 'package:igym/enums/muscle_group.dart';

final String exerciseTable = 'EXERCISE';

class ExerciseFields {
  static final String id = 'ID';
  static final String description = 'DESCRIPTION';
  static final String repetitions = 'REPETITIONS';
  static final String muscleGroupIndex = 'MUSCLE_GROUP_INDEX';
  static final String workoutId = 'WORKOUT_ID';


  static final List<String> all = [id, description, repetitions, muscleGroupIndex];
}

class Exercise {
  int? id;
  String description;
  int repetitions;
  MuscleGroup muscleGroup;
  int workoutId;

  Exercise({
    this.id,
    required this.description,
    required this.repetitions,
    required this.muscleGroup,
    required this.workoutId
  });

  Map<String, dynamic> toJson() => {
    ExerciseFields.id: id,
    ExerciseFields.description: description,
    ExerciseFields.repetitions: repetitions,
    ExerciseFields.muscleGroupIndex: muscleGroup.index,
    ExerciseFields.workoutId: workoutId
  };

  Exercise.fromJson(Map<String, dynamic> json)
      : id = json[ExerciseFields.id],
        description = json[ExerciseFields.description],
        repetitions = json[ExerciseFields.repetitions],
        muscleGroup = MuscleGroup.values[json[ExerciseFields.muscleGroupIndex]],
        workoutId = json[ExerciseFields.workoutId];

  Exercise copy({
    int? id,
    String? description,
    int? repetitions,
    MuscleGroup? muscleGroup,
    int? workoutId
  }) {
    return Exercise(
      id: id ?? this.id,
      description: description ?? this.description,
      repetitions: repetitions ?? this.repetitions,
      muscleGroup: muscleGroup ?? this.muscleGroup,
      workoutId: workoutId ?? this.workoutId
    );
  }
}