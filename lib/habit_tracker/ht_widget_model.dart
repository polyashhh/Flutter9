import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'ht_model.dart';
import 'ht_screen.dart';

class HabitTrackerWidgetModel
    extends WidgetModel<HabitTrackerScreen, HabitTrackerModel> {
  final ValueNotifier<double> waterAmount = ValueNotifier<double>(0);

  HabitTrackerWidgetModel(HabitTrackerModel model) : super(model);

  void addWater() {
    waterAmount.value = model.addWater();
  }

  void resetWater() {
    waterAmount.value = model.resetWater();
  }

  @override
  void dispose() {
    waterAmount.dispose();
    super.dispose();
  }
}