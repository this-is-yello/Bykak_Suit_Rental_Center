import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart';
import 'package:flutter/services.dart';

import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class BykakMap extends StatefulWidget {
  const BykakMap({super.key});

  @override
  State<BykakMap> createState() => _BykakMapState();
}

class _BykakMapState extends State<BykakMap> {
  double centerLng = 0;
  double centerLat = 0;
  bool loading = true;

  final markers = <Marker>[
    Marker(
      width: 120,
      height: 56,
      point: LatLng(37.4675812, 126.6567847),
      builder: (ctx) => Image.asset(
        'assets/images/parking_pin.png',
      ),
    ),
    Marker(
      width: 140,
      height: 72,
      point: LatLng(37.4677821, 126.6574401),
      builder: (ctx) => InkWell(
        child: Image.asset(
          'assets/images/bykak_pin.png',
        ),
        onTap: () async {
          final url = Uri.parse(
            'https://map.naver.com/v5/entry/place/36410973?c=17.71,0,0,0,dh',
          );
          if (await canLaunchUrl(url)) {
            launchUrl(url, mode: LaunchMode.externalApplication);
          }
        },
      ),
    ),
    Marker(
      width: 160,
      height: 80,
      point: LatLng(37.4672382, 126.6570626),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Image.asset(
            'assets/images/rental_pin.png',
          ),
          onTap: () async {
            final url = Uri.parse(
              'https://map.naver.com/v5/entry/place/1943136667?c=17.86,0,0,0,dh',
            );
            if (await canLaunchUrl(url)) {
              launchUrl(url, mode: LaunchMode.externalApplication);
            }
          },
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    loading = true;
    getPosition();
  }

  getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    try {
      setState(() {
        centerLng = position.longitude;
        centerLat = position.latitude;
        loading = false;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(37.4673611, 126.6571877),
        zoom: MediaQuery.of(context).size.width < 640 ? 17 : 18,
        // center: LatLng(51.5, -0.09),
        // zoom: 5,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://a.tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.bykak.bykaksuitrentalcenter',
        ),
        MarkerLayer(markers: markers),
      ],
    );
  }
}
