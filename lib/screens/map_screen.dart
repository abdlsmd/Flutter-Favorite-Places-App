import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
 const MapScreen(
  {
  super.key, 
  this.location = const PlaceLocation(
    latitude: 37.422, 
    longitude: -122.084, 
    address: ''
    ),
    this.isSelecting = true,
    });

 final PlaceLocation location;
 final bool isSelecting;

 @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  LatLng? _userCurrentLocation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      // Ask for permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        // Show default if permission denied forever
        setState(() {
          _userCurrentLocation = LatLng(
            widget.location.latitude,
            widget.location.longitude,
          );
          _isLoading = false;
        });
        return;
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _userCurrentLocation = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    } catch (e) {
      print("Error getting location: $e");
      setState(() {
        _userCurrentLocation = LatLng(
          widget.location.latitude,
          widget.location.longitude,
        );
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading || _userCurrentLocation == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Pick Your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(_pickedLocation);
              },
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: GoogleMap(
              initialCameraPosition: CameraPosition(
              target: widget.isSelecting
              ? _userCurrentLocation!
              : LatLng(widget.location.latitude, widget.location.longitude),
              zoom: 16,
            ),

        onTap: widget.isSelecting
            ? (position) {
                setState(() {
                  _pickedLocation = position;
                });
              }
            : null,
        markers: {
          Marker(
            markerId: const MarkerId('m1'),
            position: widget.isSelecting
            ? (_pickedLocation ?? _userCurrentLocation!)
            : LatLng(widget.location.latitude, widget.location.longitude),
  ),
},

      ),
    );
  }
}
