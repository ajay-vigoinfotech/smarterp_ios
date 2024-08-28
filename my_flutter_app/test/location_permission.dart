import 'package:geolocator/geolocator.dart';

Future<Position> _determinePosition() async {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await _geolocatorPlatform .isLocationServiceEnabled();
  if (!serviceEnabled) {

    return Future.error('Location services are disabled.');
  }

  permission = await _geolocatorPlatform .checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await _geolocatorPlatform .requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await _geolocatorPlatform.getCurrentPosition();
}