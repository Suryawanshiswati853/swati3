import 'package:intl/intl.dart';
import '../core/models/track_point.dart';
import '../core/utils/distance_calculator.dart';

class TrackingViewModel {
  final TrackPoint current;
  final TrackPoint destination;
  final double remainingDistanceMeters;
  final String eta;
  final String lastUpdated;

  TrackingViewModel({
    required this.current,
    required this.destination,
    required this.remainingDistanceMeters,
    required this.eta,
    required this.lastUpdated,
  });

  factory TrackingViewModel.from(TrackPoint current, TrackPoint destination) {
    // distance in meters
    final distMeters = DistanceCalculator.distanceInKm(
        current.lat, current.lng, destination.lat, destination.lng);

    String etaString;
    if ((current.speed ?? 0) <= 0.1) {
      etaString = current.status == 'delivered' ? 'Delivered' : 'Arrived';
    } else {
      final speedMs = (current.speed ?? 0) * 1000 / 3600; // km/h to m/s
      final seconds = distMeters / (speedMs > 0 ? speedMs : 1);
      final dur = Duration(seconds: seconds.round());
      final minutes = dur.inMinutes;
      etaString = minutes > 0 ? '$minutes min' : '${dur.inSeconds} sec';
    }

    final lastUpdated = DateFormat('hh:mm:ss a')
        .format(current.timestamp ?? DateTime.now());

    return TrackingViewModel(
      current: current,
      destination: destination,
      remainingDistanceMeters: distMeters,
      eta: etaString,
      lastUpdated: lastUpdated,
    );
  }

  String distanceKmString() {
    final km = remainingDistanceMeters / 1000.0;
    if (km < 1) {
      return '${remainingDistanceMeters.round()} m';
    } else {
      return '${km.toStringAsFixed(2)} km';
    }
  }
}


