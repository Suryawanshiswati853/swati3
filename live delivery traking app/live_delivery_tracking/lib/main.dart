import 'app.dart';
import 'blocs/map/map_bloc.dart';
import 'package:flutter/material.dart';
import 'blocs/tracking/tracking_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/services/mock_socket_service.dart';
import 'data/repositories/tracking_repository.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final socket = MockSocketService(assetPath: 'assets/mock/route_hyd.json');
  final repo = TrackingRepository(socketService: socket);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TrackingRepository>(
          create: (_) => repo,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          
              BlocProvider<TrackingBloc>(
      create: (_) => TrackingBloc(repository: repo),
    ),
          
          BlocProvider<MapBloc>(
            create: (context) => MapBloc(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
