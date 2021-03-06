import 'package:flutter/material.dart';

import '../widgets/aircraft_selector.dart';
import '../widgets/app_drawer.dart';
import '../widgets/new_route_leg.dart';
import '../widgets/pending_jobs_list.dart';
import '../widgets/planner_bock.dart';
import '../widgets/planner_map.dart';
import '../widgets/route_legs_list.dart';

class PlannerScreen extends StatefulWidget {
  static const routeName = '/planner';
  final String title;

  PlannerScreen(this.title);

  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.title),
            Expanded(
              child: AircraftSelector(),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(widget.title),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: PlannerBlock(child: PendingJobsList()),
                ),
                Expanded(
                  child: PlannerBlock(child: PlannerMap()),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: PlannerBlock(child: NewRouteLeg())),
                Expanded(
                  flex: 2,
                  child: PlannerBlock(child: RouteLegsList()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
