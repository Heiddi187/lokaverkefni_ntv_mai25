import 'package:flutter/material.dart';
import 'package:lokaverkefni/dice_roller.dart';

class DiceScreen extends StatelessWidget {
  const DiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar í dice_screen')),
      body: DiceRoller(),
    );
  }
}

// breyta teningum í buttons
