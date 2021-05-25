import 'dart:io';
import 'package:flutter/foundation.dart';

class CustomLocation {
  final double latitude;
  final double longitude;
  final String address;

  CustomLocation(
      {@required this.latitude, @required this.longitude, this.address});
}

class Place {
  final String id;
  final String title;
  final File image;
  final CustomLocation location;

  Place(
      {@required this.id,
      @required this.title,
      @required this.image,
      @required this.location});
}
