import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';

class UserLocationScreen extends StatefulWidget {
  const UserLocationScreen({super.key});

  static const routeName = "/user-location";

  @override
  State<UserLocationScreen> createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {
  StreamController<Map<String, dynamic>> _locationStreamController =
      StreamController<Map<String, dynamic>>();
  Map<String, dynamic> userPosition = {'lat': 14.0996, "lng": 122.9550};

  void _registerPlatformInstance() {
    if (Platform.isAndroid) {
      GeolocatorAndroid.registerWith();
    } else if (Platform.isIOS) {
      GeolocatorApple.registerWith();
    }
  }

  Future<void> _updateUserLocation() async {
    try {
      _registerPlatformInstance();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      Map<String, dynamic> newPosition = {
        "lat": position.latitude,
        'lng': position.longitude
      };
      setState(() {
        userPosition = newPosition;
        print(userPosition);
      });
      _locationStreamController.add(newPosition);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    // Start updating the user's location every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      _updateUserLocation();
    });
  }

  @override
  void dispose() {
    _locationStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location')),
      body: StreamBuilder<Map<String, dynamic>>(
        stream: _locationStreamController.stream,
        initialData: userPosition,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            // userPosition = snapshot.data!;
            // print(userPosition);
            return FlutterMap(
              options: MapOptions(
                center: LatLng(userPosition['lat'], userPosition['lng']),
                zoom: 9.2,
              ),
              nonRotatedChildren: const [
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                    ),
                  ],
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(14.0996, 122.9550),
                      width: 100,
                      height: 100,
                      builder: (context) => const FlutterLogo(),
                    ),
                  ],
                ),
              ],
            );
          }

          return const Text("Loaded");
        },
      ),
    );
  }
}
