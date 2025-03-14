import 'package:flutter/material.dart';
import 'card_model.dart';

class GameProvider with ChangeNotifier {
  List<CardModel> cards = [];

  GameProvider() {
    _initializeCards();
  }

  void _initializeCards() {
    List<String> values = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E', 'F', 'F', 'G', 'G', 'H', 'H'];
    values.shuffle();

    cards = values.map((val) => CardModel(value: val)).toList();
    notifyListeners();
  }

  void flipCard(int index) {
    if (cards[index].isMatched || cards[index].isFaceUp) return;

    cards[index].isFaceUp = !cards[index].isFaceUp;
    notifyListeners();
  }
}
