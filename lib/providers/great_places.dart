import 'dart:io';

import 'package:flutter/material.dart';
import '../models/place.dart';

class GreatPlaces extends ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        title: title,
        image: image,
        id: DateTime.now().toString(),
        location: null);
    _items.add(newPlace);
    notifyListeners();
  }
}
