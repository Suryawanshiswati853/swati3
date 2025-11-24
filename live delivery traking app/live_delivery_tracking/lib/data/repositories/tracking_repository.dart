import 'dart:async';
import '../../core/models/track_point.dart';
import '../services/mock_socket_service.dart';

class TrackingRepository {
  final MockSocketService socketService;

  TrackingRepository({required this.socketService});

  Stream<TrackPoint> start() {
    socketService.start();
    return socketService.stream;
  }

  void stop() {
    socketService.stop();
  }

  void dispose() {
    socketService.dispose();
  }
}
