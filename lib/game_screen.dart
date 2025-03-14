import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';
import 'card_model.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Card Matching Game')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: gameProvider.cards.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => gameProvider.flipCard(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: gameProvider.cards[index].isFaceUp ? Colors.white : Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                ),
                child: Center(
                  child: Text(
                    gameProvider.cards[index].isFaceUp ? gameProvider.cards[index].value : '?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
