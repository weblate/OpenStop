import 'dart:math';

import 'package:animated_marker_layer/animated_marker_layer.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';


import 'package:osm_api/osm_api.dart';

class OsmElementLayer extends StatefulWidget {
  final Iterable<OSMElement> osmElements;

  final void Function(OSMElement osmElement)? onOsmElementTap;

  /// The maximum shift in duration between different markers.

  final Duration durationOffsetRange;

  const OsmElementLayer({
    required this.osmElements,
    this.onOsmElementTap,
    this.durationOffsetRange = const Duration(milliseconds: 300),
  });

  @override
  State<OsmElementLayer> createState() => _OsmElementLayerState();
}

class _OsmElementLayerState extends State<OsmElementLayer> {
  final _random = Random();

  late List<AnimatedMarker> _markers;

  @override
  void initState() {
    super.initState();
    _markers = _buildMarkers();
  }

  @override
  void didUpdateWidget(covariant OsmElementLayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    _markers = _buildMarkers();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedMarkerLayer(
      markers: _markers,
    );
  }


  List<AnimatedMarker> _buildMarkers() {
    final List<AnimatedMarker> _markers = [];
    for (final osmElement in widget.osmElements) {
      if (_ignore(osmElement)) continue;

      _markers.add(_buildNodeMarker(osmElement as OSMNode));
    }
    return _markers;
  }


  bool _ignore(OSMElement osmElement) {
    return !(osmElement is OSMNode && osmElement.tags.isNotEmpty);
  }


  Duration _getRandomDelay() {
    if (widget.durationOffsetRange.inMicroseconds == 0) {
      return Duration.zero;
    }
    final randomTimeOffset = _random.nextInt(widget.durationOffsetRange.inMicroseconds);
    return Duration(microseconds: randomTimeOffset);
  }


  AnimatedMarker _buildNodeMarker(OSMNode osmNode) {
    return AnimatedMarker(
      key: ValueKey(osmNode),
      point: LatLng(osmNode.lat, osmNode.lon),
      animateInDelay: _getRandomDelay(),
      animateOutDelay: _getRandomDelay(),
      child: GestureDetector(
        onTap: () => widget.onOsmElementTap?.call(osmNode),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(
              color: Colors.white,
              width: 3
            )
          ),
        ),
      ),
    );
  }
}