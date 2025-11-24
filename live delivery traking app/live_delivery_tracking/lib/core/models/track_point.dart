import 'package:equatable/equatable.dart';

class TrackPoint extends Equatable {
  final double lat;
  final double lng;
  final double speed; // km/h
  final double heading; // degrees
  final String status;
  final DateTime timestamp;

  const TrackPoint({
    required this.lat,
    required this.lng,
    required this.speed,
    required this.heading,
    required this.status,
    required this.timestamp,
  });

  factory TrackPoint.fromJson(Map<String, dynamic> json) {
    return TrackPoint(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
      heading: (json['heading'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? '',
      timestamp: DateTime.now(),
    );
  }

  TrackPoint copyWith({double? lat, double? lng, double? speed, double? heading, String? status, DateTime? timestamp}) {
    return TrackPoint(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      speed: speed ?? this.speed,
      heading: heading ?? this.heading,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  List<Object?> get props => [lat, lng, speed, heading, status, timestamp];
}
