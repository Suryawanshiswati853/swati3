import 'dart:async';
import 'tracking_event.dart';
import 'tracking_state.dart';
import 'package:bloc/bloc.dart';
import '../../core/models/track_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/tracking_repository.dart';




class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final TrackingRepository repository;

  StreamSubscription<TrackPoint>? _sub;
  final List<TrackPoint> _history = [];

  TrackingBloc({required this.repository}) : super(TrackingInitial()) {
    on<StartTracking>(_onStart);
    on<StopTracking>(_onStop);
  }

  Future<void> _onStart(
    StartTracking event,
    Emitter<TrackingState> emit,
  ) async {
    // in case restart
    _history.clear();
    emit(TrackingInitial());

    // Cancel old subscription if exists
    await _sub?.cancel();

    // Start repository steam
    final stream = repository.start();

    _sub = stream.listen(
      (point) {
        _history.add(point);

        emit(
          TrackingRunning(
            current: point,
            history: List<TrackPoint>.from(_history),
          ),
        );
      },
      onError: (error, stackTrace) {

      },
      onDone: () {
       
      },
      cancelOnError: false,
    );
  }

  Future<void> _onStop(
    StopTracking event,
    Emitter<TrackingState> emit,
  ) async {
    // stop emitting from mock socket
    repository.stop();

    // cancel subscription
    await _sub?.cancel();
    _sub = null;

    emit(TrackingStopped());
  }

  @override
  Future<void> close() {
    _sub?.cancel();
   
    return super.close();
  }
}
