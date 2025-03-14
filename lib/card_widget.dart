import 'package:flutter/material.dart';
import 'card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final VoidCallback onTap;

  const CardWidget({Key? key, required this.card, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Center(
          child: card.isFaceUp
              ? Text(
                  card.value,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )
              : Image.asset("assets/hellokitty.jpg", fit: BoxFit.cover),
        ),
      ),
    );
  }
}
