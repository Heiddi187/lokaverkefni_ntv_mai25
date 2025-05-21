import 'package:flutter/material.dart';
import 'package:lokaverkefni/dice_roller.dart';
import 'package:lokaverkefni/dice_roller2.dart';
import 'package:lokaverkefni/dice_roller3.dart';

class DiceScreen extends StatelessWidget {
  const DiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar í dice_screen')),
      body: DiceRoller3(),
    );
  }
}

// breyta teningum í buttons
