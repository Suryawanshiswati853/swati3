import 'package:equatable/equatable.dart';
import '../../core/models/track_point.dart';


abstract class TrackingState extends Equatable {
  const TrackingState();
  @override
  List<Object?> get props => [];
}

class TrackingInitial extends TrackingState {}

class TrackingRunning extends TrackingState {
  final TrackPoint current;
  final List<TrackPoint> history;
  const TrackingRunning({required this.current, required this.history});
  @override
  List<Object?> get props => [current, history];
}

class TrackingStopped extends TrackingState {}
