import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:igym/models/workout.dart';
import 'package:igym/services/workout_service.dart';

class WorkoutsPage extends StatefulWidget {
  WorkoutsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {

  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final WorkoutService workoutService = WorkoutService();

  List<Workout> workouts = [];

  Future<bool> _asyncInit() async {
    await _memoizer.runOnce(() async {
      workouts = await workoutService.findAll();
    });
    return true;
  }

  Widget buildWidgetItem(Workout workout) => ListTile(
    title: Text(workout.name),
  );

  Widget buildWorkoutsListView() => ListView(
    children: workouts.map(buildWidgetItem).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _asyncInit(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Errore durante il caricamento'));
          }
          return buildWorkoutsListView();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
    );
  }
}