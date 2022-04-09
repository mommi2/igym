import 'package:flutter/material.dart';
import 'package:igym/enums/muscle_group.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget buildTiles() => GridView.count(
    crossAxisCount: 2,
    children: [
      Card(child: Text('Workouts'),),
      Card(child: Text('Workouts'),),
      Card(child: Text('Workouts'),),
      Card(child: Text('Workouts'),),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.all(7),
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            child: Column(
                              children: [
                                Text('allenamento corrente'),
                                Text(
                                  MuscleGroup.abdominals.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            )
                          ),
                          Icon(Icons.arrow_downward),
                          Container(
                            child: Row(
                              children: [
                                Text('Prossimo allenamento'),
                                Text(MuscleGroup.arms.name),
                              ],
                            ),
                          )

                        ],
                      ),
                    )
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Column(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.done)
                              ),
                              Text('Fatto'),
                            ],
                          ),

                          TextButton.icon(onPressed: () {}, icon: Icon(Icons.refresh), label: Text('Riparti da')),
                        ],
                      ),
                    )
                  ),




                ],

              ),
            ),
          ),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
            tooltip: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_rounded),
            label: '',
            tooltip: 'Workouts'
          )
        ],
      ),
    );
  }
}