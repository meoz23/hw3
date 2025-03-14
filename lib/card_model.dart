import 'package:flutter/material.dart';

class CardModel {
  final String value;
  bool isFaceUp;
  bool isMatched;

  CardModel({required this.value, this.isFaceUp = false, this.isMatched = false});
}