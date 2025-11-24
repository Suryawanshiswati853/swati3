import 'dart:async';
import 'package:flutter/material.dart';
import 'widgets/driver_bottom_sheet.dart';
import '../../core/models/track_point.dart';
import '../../data/services/mock_socket_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';





class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  GoogleMapController? _mapController;
  Marker? _driverMarker;
  Marker? _destMarker;
  Set<Polyline> _polylines = {};
  final LatLng _initial = const LatLng(17.437462, 78.448288);
  final TrackPoint _destPoint = TrackPoint(
    lat: 17.424354,
    lng: 78.473945,
    speed: 0,
    heading: 0,
    status: 'destination',
    timestamp: DateTime.now(),
  );

  BitmapDescriptor? _carIcon;
  List<LatLng> _historyLatLng = [];
  TrackPoint? _currentPoint;

  late MockSocketService _socketService;
  StreamSubscription<TrackPoint>? _sub;
  bool _isTracking = false;

  @override
  void initState() {
    super.initState();
    _loadCarIcon();
    _socketService = MockSocketService(assetPath: 'assets/mock/route_hyd.json');

    _sub = _socketService.stream.listen((point) {
      setState(() {
        final status = _computeStatus(point.lat);

        _currentPoint = TrackPoint(
          lat: point.lat,
          lng: point.lng,
          heading: point.heading,
          speed: point.speed,
          status: status,
          timestamp: DateTime.now(),
        );

        _updateMap(_currentPoint!);
      });
    });

    _setupDestMarker();
  }

  @override
  void dispose() {
    _sub?.cancel();
    _mapController?.dispose();
    _socketService.dispose();
    super.dispose();
  }

  /// Load car icon for driver
  Future<void> _loadCarIcon() async {
    _carIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(30, 30)),
      'assets/images/car.jpeg',
    );
  }

  void _setupDestMarker() {
    _destMarker = Marker(
      markerId: const MarkerId('dest'),
      position: LatLng(_destPoint.lat, _destPoint.lng),
      infoWindow: const InfoWindow(title: 'Customer'),
    );
  }

  void _updateMap(TrackPoint point) {
    _historyLatLng.add(LatLng(point.lat, point.lng));

    final polyline = Polyline(
      polylineId: const PolylineId('route_poly'),
      points: _historyLatLng,
      color: Colors.purple,
      width: 5,
    );

    _driverMarker = Marker(
      markerId: const MarkerId('driver'),
      position: LatLng(point.lat, point.lng),
      rotation: point.heading,
      infoWindow: InfoWindow(title: 'Driver — ${point.status}'),
      icon: _carIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      anchor: const Offset(0.5, 0.5),
    );

    _polylines = {polyline};

    _mapController?.animateCamera(
      CameraUpdate.newLatLng(LatLng(point.lat, point.lng)),
    );
  }

  String _computeStatus(double lat) {
    if (lat >= 17.437 && lat < 17.435) return 'picked';
    if (lat >= 17.435 && lat < 17.430) return 'en_route';
    if (lat >= 17.430 && lat < 17.425) return 'arriving';
    return 'delivered';
  }

  void _startTracking() {
    if (_isTracking) return;
    setState(() => _isTracking = true);
    _socketService.start();
  }

  void _stopTracking() {
    if (!_isTracking) return;
    setState(() => _isTracking = false);
    _socketService.stop();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Live Delivery Tracking'),
        actions: [
          IconButton(
            icon: Icon(_isTracking ? Icons.stop : Icons.play_arrow),
            onPressed: _isTracking ? _stopTracking : _startTracking,
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _initial, zoom: 14),
            onMapCreated: _onMapCreated,
            markers: {
              if (_driverMarker != null) _driverMarker!,
              if (_destMarker != null) _destMarker!,
            },
            polylines: _polylines,
            zoomControlsEnabled: false,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
          ),

          // Top card with start/stop
          Positioned(
            left: 12,
            top: 12,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Order: ORD123456', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    ElevatedButton.icon(
                      onPressed: _isTracking ? _stopTracking : _startTracking,
                      icon: Icon(_isTracking ? Icons.stop : Icons.play_arrow),
                      label: Text(_isTracking ? 'Stop' : 'Start'),
                      style: ElevatedButton.styleFrom(minimumSize: const Size(120, 36)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: _currentPoint != null
                ? DriverBottomSheet(
                    driverName: 'Ravi Kumar',
                    vehicle: 'Honda Activa',
                    status: _currentPoint!.status, // auto-update
                    eta: '5 min', 
                    distance: '2.3 km', 
                    lastUpdated: 'Now', 
                    onTapCenter: () {
                      _mapController?.animateCamera(
                        CameraUpdate.newLatLng(
                          LatLng(_currentPoint!.lat, _currentPoint!.lng),
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

