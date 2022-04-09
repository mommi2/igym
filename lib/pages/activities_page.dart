import 'package:flutter/material.dart';
import 'package:igym/enums/muscle_group.dart';

class ActivitiesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActivitiesPageState();

}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}