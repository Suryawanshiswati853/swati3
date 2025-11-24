import 'dart:async';
import 'map_event_state.dart';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<AnimateMarker>(_onAnimateMarker);
    on<MoveCameraTo>(_onMoveCameraTo);
    on<UpdatePolyline>(_onUpdatePolyline);
  }

  LatLng _currentMarker = const LatLng(17.437462, 78.448288);
  double _currentHeading = 0.0;
  final Set<Polyline> _polylines = {};

  FutureOr<void> _onAnimateMarker(AnimateMarker event, Emitter<MapState> emit) {
    _currentMarker = LatLng(event.point.lat, event.point.lng);
    _currentHeading = event.point.heading;
    emit(MapUpdated(
      marker: _currentMarker,
      heading: _currentHeading,
      polylines: Set<Polyline>.from(_polylines),
    ));
  }

  FutureOr<void> _onMoveCameraTo(MoveCameraTo event, Emitter<MapState> emit) {
    emit(MapUpdated(marker: event.target, heading: _currentHeading, polylines: Set<Polyline>.from(_polylines)));
  }

  FutureOr<void> _onUpdatePolyline(UpdatePolyline event, Emitter<MapState> emit) {
    _polylines.clear();
    _polylines.add(Polyline(
      polylineId: const PolylineId('route_poly'),
      points: event.polyline,
      width: 5,
    ));
    emit(MapUpdated(marker: _currentMarker, heading: _currentHeading, polylines: Set<Polyline>.from(_polylines)));
  }
}
