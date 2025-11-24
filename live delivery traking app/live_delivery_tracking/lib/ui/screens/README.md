# Live Delivery Tracking App (Flutter)

A Flutter application for real-time delivery driver tracking using Google Maps.  
The app displays the driver’s current location, route, status, ETA, distance, and last updated time, with automatic status updates based on latitude.

---

## Features

- Real-time driver location tracking on Google Maps.
- Route simulation using `MockSocketService` with JSON route data.
- Driver status updates automatically (`picked`, `en_route`, `arriving`, `delivered`) based on latitude.
- Polyline visualization for route traveled.
- Bottom sheet displays:
  - Driver Name
  - Vehicle
  - Status
  - Distance
  - ETA
  - Last Update
- Google Maps camera follows driver movement.
- Easy customization of driver icon and route data.

---

## Project Structure
lib/
├─ main.dart
├─ screens/
│  └─ tracking_screen.dart
├─ services/
│  └─ mock_socket_service.dart
├─ models/
│  └─ track_point.dart
├─ widgets/
│  └─ driver_bottom_sheet.dart
├─ bloc/
│  ├─ tracking_bloc.dart
│  └─ map_bloc.dart
└─ utils/
   └─ constants.dart
