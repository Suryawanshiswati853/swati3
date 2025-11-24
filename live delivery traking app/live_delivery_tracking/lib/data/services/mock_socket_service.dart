import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../core/models/track_point.dart';
import 'package:flutter/services.dart' show rootBundle;





class MockSocketService {
  final String assetPath;

  final _controller = StreamController<TrackPoint>.broadcast();
  Stream<TrackPoint> get stream => _controller.stream;

  Timer? _timer;
  List<TrackPoint> _points = [];
  int _currentIndex = 0;
  bool _isRunning = false;

  MockSocketService({required this.assetPath});

  /// Start emitting sequential track points every 2–3 seconds.
  Future<void> start() async {
    if (_isRunning) return; 
    _isRunning = true;

    // Load and prepare data only once per start.
    final raw = await rootBundle.loadString(assetPath);
    final jsonData = json.decode(raw) as Map<String, dynamic>;
    final route = (jsonData['route'] as List).cast<Map<String, dynamic>>();

    _points = _buildSimulatedPoints(route);
    _currentIndex = 0;

    // Clear previous timer if any
    _timer?.cancel();

    // First emit immediately
    if (_points.isNotEmpty) {
      _controller.add(_points[_currentIndex]);
      _currentIndex++;
    }

    // Then emit others with 2–3 seconds delay
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentIndex >= _points.length) {
        timer.cancel();
        _isRunning = false;
        return;
      }

      final extra = Random().nextBool() ? 1 : 0;
     
      final p = _points[_currentIndex];
      _controller.add(p);
      _currentIndex++;
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    _currentIndex = 0;
    _points = [];
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }

  List<TrackPoint> _buildSimulatedPoints(List<Map<String, dynamic>> route) {
    final specs = [
      {'speed': 20.2, 'heading': 90},
      {'speed': 25.1, 'heading': 100},
      {'speed': 27.0, 'heading': 110},
      {'speed': 29.5, 'heading': 115},
      {'speed': 31.0, 'heading': 120},
      {'speed': 26.8, 'heading': 130},
      {'speed': 18.4, 'heading': 140},
      {'speed': 15.2, 'heading': 150},
      {'speed': 0.0, 'heading': 160},
    ];

    final points = <TrackPoint>[];
    for (var i = 0; i < route.length; i++) {
      final item = route[i];
      final lat = (item['lat'] as num).toDouble();
      final lng = (item['lng'] as num).toDouble();

      String status;
      if (i == 0) {
        status = 'picked';
      } else if (i < 5) {
        status = 'en_route';
      } else if (i < 8) {
        status = 'arriving';
      } else {
        status = 'delivered';
      }

      final speed = (specs[i]['speed'] as num).toDouble();
      final heading = (specs[i]['heading'] as num).toDouble();

      points.add(
        TrackPoint(
          lat: lat,
          lng: lng,
          speed: speed,
          heading: heading,
          status: status,
          timestamp: DateTime.now(),
        ),
      );
    }
    return points;
  }
}
