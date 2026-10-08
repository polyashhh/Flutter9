import 'package:elementary/elementary.dart';

class HabitTrackerModel extends ElementaryModel {
  double _waterAmount = 0;

  double get waterAmount => _waterAmount;

  double addWater() {
    if (_waterAmount < 2) {
      _waterAmount += 0.25;
    }

    return _waterAmount;
  }

  double resetWater() {
    _waterAmount = 0;
    return _waterAmount;
  }
}