class CardModel {
  String value;
  bool isFaceUp;
  bool isMatched;

  CardModel({
    required this.value,
    this.isFaceUp = false,
    this.isMatched = false,
  });
}
