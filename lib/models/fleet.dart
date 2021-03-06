import 'package:flutter/foundation.dart';

import './aircraft.dart';

class Fleet with ChangeNotifier {
  List<Aircraft> _aircrafts = [];

  Fleet();

  List<Aircraft> get aircrafts => [..._aircrafts];

  Aircraft get activeAircraft => aircrafts.firstWhere((aircraft) => aircraft.isActive);

  void updateAircrafts(List<Aircraft> aircrafts) {
    _aircrafts = aircrafts;
    if (_aircrafts.isNotEmpty) {
      _aircrafts.first.isActive = true;
    }
    notifyListeners();
  }

  void setActive(String id) {
    aircrafts.forEach((aircraft) {
      if (aircraft.id == id) {
        aircraft.isActive = true;
      } else if (aircraft.isActive) {
        aircraft.isActive = false;
      }
    });
    notifyListeners();
  }
}
