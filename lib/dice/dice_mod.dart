import 'package:flutter/material.dart';

class DiceDisplay extends StatelessWidget {
  final List<int> diceValues;
  final List<bool> diceLocked;
  final void Function(int index) onDieTapped;

  const DiceDisplay({
    super.key,
    required this.diceValues,
    required this.diceLocked,
    required this.onDieTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15,
      runSpacing: 15,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => onDieTapped(index),
          child: Stack(
            children: [
              Image.asset(
                "dice_images/dice-six-faces-${diceValues[index]}.png",
                height: 100,
              ),
              if (diceLocked[index])
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
            ],
          ),
        );
      }),
    );
  }
}
