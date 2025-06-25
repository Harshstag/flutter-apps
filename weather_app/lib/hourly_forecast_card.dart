import 'package:flutter/material.dart';

class HourlyForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const HourlyForecastCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: const Color.fromARGB(255, 57, 58, 78),
      child: Container(
        width: 90,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Icon(icon, size: 32),
            SizedBox(height: 8),
            Text(
              temperature,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
