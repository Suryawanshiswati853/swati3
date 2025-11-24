import '../../data/services/mock_socket_service.dart';
import 'package:live_delivery_tracking/core/models/track_point.dart';



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
