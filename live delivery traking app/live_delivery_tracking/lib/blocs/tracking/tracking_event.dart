import 'package:equatable/equatable.dart';
import '../../core/models/track_point.dart';

abstract class TrackingEvent extends Equatable {
  const TrackingEvent();
  @override
  List<Object?> get props => [];
}

class StartTracking extends TrackingEvent {}

class UpdateLocation extends TrackingEvent {
  final TrackPoint point;
  const UpdateLocation({required this.point});
  @override
  List<Object?> get props => [point];
}

class UpdateStatus extends TrackingEvent {
  final String status;
  const UpdateStatus(this.status);
  @override
  List<Object?> get props => [status];
}

class StopTracking extends TrackingEvent {}
