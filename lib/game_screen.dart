import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';
import 'card_widget.dart';

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
            return CardWidget(
              card: gameProvider.cards[index],
              onTap: () => gameProvider.flipCard(index),
            );
          },
        ),
      ),
    );
  }
}