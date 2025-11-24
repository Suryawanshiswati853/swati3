import 'package:equatable/equatable.dart';
import '../../core/models/track_point.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


abstract class MapEvent extends Equatable {
  const MapEvent();
  @override
  List<Object?> get props => [];
}

class AnimateMarker extends MapEvent {
  final TrackPoint point;
  const AnimateMarker(this.point);
  @override
  List<Object?> get props => [point];
}

class MoveCameraTo extends MapEvent {
  final LatLng target;
  final double zoom;
  const MoveCameraTo(this.target, {this.zoom = 15});
  @override
  List<Object?> get props => [target, zoom];
}

class UpdatePolyline extends MapEvent {
  final List<LatLng> polyline;
  const UpdatePolyline(this.polyline);
  @override
  List<Object?> get props => [polyline];
}

abstract class MapState extends Equatable {
  const MapState();
  @override
  List<Object?> get props => [];
}

class MapInitial extends MapState {}

class MapUpdated extends MapState {
  final LatLng marker;
  final double heading;
  final Set<Polyline> polylines;
  const MapUpdated({required this.marker, required this.heading, required this.polylines});
  @override
  List<Object?> get props => [marker, heading, polylines];
}
