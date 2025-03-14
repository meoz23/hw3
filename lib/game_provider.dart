import 'package:flutter/material.dart';
import 'card_model.dart';

class GameProvider with ChangeNotifier {
  List<CardModel> cards = [];
  List<int> flippedCards = [];
  int score = 0;

  GameProvider() {
    _initializeCards();
  }

  void _initializeCards() {
    List<String> values = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E', 'F', 'F', 'G', 'G', 'H', 'H'];
    values.shuffle();

    cards = values.map((val) => CardModel(value: val)).toList();
    flippedCards.clear();
    score = 0;
    notifyListeners();
  }

  void flipCard(int index) {
    if (cards[index].isMatched || cards[index].isFaceUp) return;

    cards[index].isFaceUp = true;
    flippedCards.add(index);

    if (flippedCards.length == 2) {
      Future.delayed(Duration(seconds: 1), () {
        if (cards[flippedCards[0]].value == cards[flippedCards[1]].value) {
          cards[flippedCards[0]].isMatched = true;
          cards[flippedCards[1]].isMatched = true;
          score += 10;
        } else {
          cards[flippedCards[0]].isFaceUp = false;
          cards[flippedCards[1]].isFaceUp = false;
          score -= 2;
        }
        flippedCards.clear();
        notifyListeners();
      });
    } else {
      notifyListeners();
    }
  }
}