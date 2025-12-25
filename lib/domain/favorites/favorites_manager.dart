import 'package:flutter/material.dart';
import 'package:charity_app/domain/model/charity.dart';

class FavoritesManager {
  static final ValueNotifier<List<Charity>> favoriteCharities = ValueNotifier([]);

  static void toggleFavorite(Charity charity) {
    final currentList = List<Charity>.from(favoriteCharities.value);

    bool isAlreadyFav = currentList.any((element) => element.name == charity.name);

    if (isAlreadyFav) {
      currentList.removeWhere((element) => element.name == charity.name);
    } else {
      currentList.add(charity);
    }

    favoriteCharities.value = currentList;
  }

  static bool isFavorite(Charity charity) {
    return favoriteCharities.value.any((element) => element.name == charity.name);
  }
}