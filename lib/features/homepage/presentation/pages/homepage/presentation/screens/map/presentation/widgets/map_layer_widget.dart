import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/map/presentation/widgets/active_marker_widget.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/pages/homepage/presentation/screens/map/presentation/widgets/custom_map_dot_widget.dart';

Widget buildMapLayer({required VoidCallback onMarkerTap}) {
  return FlutterMap(
    options: MapOptions(
      initialCenter: const LatLng(12.9716, 77.5946),
      initialZoom: 16.0,
    ),
    children: [
      TileLayer(
        urlTemplate:
            'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
      ),
      MarkerLayer(
        markers: [
          //Standard marker
          const Marker(
            point: LatLng(12.8520, 77.7070),
            width: 30,
            height: 30,
            child: CustomMapDot(),
          ),
          //Active marker with tooltip
          Marker(
            point: const LatLng(12.9716, 77.5946),
            width: 150,
            height: 90,
            child: GestureDetector(
              onTap: onMarkerTap,
              child: const ActiveMarkerWithToolTip(),
            ),
          ),
        ],
      ),
    ],
  );
}
