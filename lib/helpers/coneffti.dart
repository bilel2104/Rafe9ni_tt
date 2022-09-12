import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Confetti extends StatelessWidget {
  final ConfettiController confettiController;
  Confetti(this.confettiController);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: confettiController,
        colors: [
          Colors.red,
          Colors.blue,
          Colors.green,
          Colors.yellow,
          Colors.purple,
          Colors.pink,
          Colors.brown
        ],
        shouldLoop: true,
        numberOfParticles: 28,
        emissionFrequency: 0.07,
        blastDirectionality: BlastDirectionality.explosive,
        gravity: 0.1,
        minBlastForce: 12,
        maxBlastForce: 16,
      ),
    );
  }
}
