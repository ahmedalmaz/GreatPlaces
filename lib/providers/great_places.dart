import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greate_places/helpers/db_helper.dart';
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
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetData() async {
    final places = await DBHelper.getData('user_places');
    _items = places
        .map((data) => Place(
            id: data['id'],
            title: 'title',
            image: File(data['image']),
            location: null))
        .toList();
    notifyListeners();
  }
}
