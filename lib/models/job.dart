import './job_leg.dart';

class Job {
  final String id;
  final String description;
  final List<JobLeg> _legs;
  String _departureFilter = '';
  var _showCompleted = false;

  Job(
    this.id,
    this.description,
    this._legs,
  );

  List<JobLeg> get legs {
    List<JobLeg> legs = [..._legs];
    if (!_showCompleted) {
      legs = [..._legs.where((l) => !l.isComplete)];
    }
    if (_departureFilter.isNotEmpty) {
      legs = legs.where((l) => l.departureAirport.icao.contains(_departureFilter)).toList();
    }
    return legs;
  }

  bool get hasSightSeeingLeg => _legs.any((l) => l.isSightSeeing);

  List<JobLeg> get selectedLegs => _legs.where((l) => l.isSelected).toList();

  List<JobLeg> get loadedLegs => _legs.where((l) => l.isLoaded).toList();

  void filterByDeparture(String icao) {
    _departureFilter = icao;
  }

  void showCompleted(bool showCompleted) {
    _showCompleted = showCompleted;
  }

  void reset() {
    legs.forEach((l) => l.reset());
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    final List<JobLeg> jobLegs = [];
    if (json.containsKey("Cargos")) {
      jobLegs.addAll((json["Cargos"] as List).map((e) => JobLeg.fromJson(e)));
    }
    if (json.containsKey("Charters")) {
      jobLegs.addAll((json["Charters"] as List).map((e) => JobLeg.fromJson(e)));
    }
    return Job(
      json["Id"],
      json["Description"],
      jobLegs,
    );
  }
}
