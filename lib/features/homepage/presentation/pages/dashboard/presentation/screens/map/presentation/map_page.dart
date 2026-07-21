import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vanashree_ngo_application/core/common/components/google_maps.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;

  final LatLng _initialPosition = const LatLng(27.7172, 85.3240);

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    _markers = {
      const Marker(
        markerId: MarkerId('kathmandu'),
        position: LatLng(27.7172, 85.3240),
        infoWindow: InfoWindow(title: 'Kathmandu'),
      ),
    };
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: const InfoWindow(title: 'Selected Location'),
        ),
      );
    });
  }

  void _goToKathmandu() {
    _controller?.animateCamera(
      CameraUpdate.newLatLngZoom(const LatLng(27.7172, 85.3240), 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _goToKathmandu,
          ),
        ],
      ),
      body: AppGoogleMap(
        initialLocation: _initialPosition,
        markers: _markers,
        onMapCreated: (controller) {
          _controller = controller;
        },
        onTap: _onMapTap,
      ),
    );
  }
}
