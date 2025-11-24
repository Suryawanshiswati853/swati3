import 'package:flutter/material.dart';

class DriverBottomSheet extends StatelessWidget {
  final String driverName;
  final String vehicle;
  final String status;
  final String eta;
  final String distance;
  final String lastUpdated;
  final VoidCallback? onTapCenter;

  const DriverBottomSheet({
    super.key,
    required this.driverName,
    required this.vehicle,
    required this.status,
    required this.eta,
    required this.distance,
    required this.lastUpdated,
    this.onTapCenter,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.22;
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black26)],
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              child: Text(driverName.split(' ').map((s) => s[0]).take(2).join()),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(driverName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(vehicle),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Chip(label: Text(status)),
                      const SizedBox(width: 8),
                      Text('ETA: $eta', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Distance: $distance'),
                  const SizedBox(height: 4),
                  Text('Last: $lastUpdated', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: onTapCenter,
                  icon: const Icon(Icons.center_focus_strong),
                ),
                IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.phone),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
