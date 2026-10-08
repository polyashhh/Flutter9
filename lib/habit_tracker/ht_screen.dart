import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'ht_model.dart';
import 'ht_widget_model.dart';

class HabitTrackerScreen extends ElementaryWidget<HabitTrackerWidgetModel> {
  const HabitTrackerScreen({
    Key? key,
    WidgetModelFactory wmFactory = habitTrackerWidgetModelFactory,
  }) : super(wmFactory, key: key);
  @override
  Widget build(HabitTrackerWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(title: const Text('Трекер привычки')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Пить 2 л воды',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ValueListenableBuilder<double>(
              valueListenable: wm.waterAmount,
              builder: (context, value, child) {
                return Column(
                  children: [
                    Text(
                      'Выпито: ${value.toStringAsFixed(2)} / 2.00 л',
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: 250,
                      child: LinearProgressIndicator(value: value / 2),
                    ),

                    const SizedBox(height: 12),

                    if (value >= 2)
                      const Text(
                        'Цель на сегодня выполнена!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: wm.addWater,
              child: const Text('+0.25 л'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: wm.resetWater,
              child: const Text('Сбросить'),
            ),
          ],
        ),
      ),
    );
  }
}

HabitTrackerWidgetModel habitTrackerWidgetModelFactory(BuildContext context) {
  return HabitTrackerWidgetModel(HabitTrackerModel());
}
