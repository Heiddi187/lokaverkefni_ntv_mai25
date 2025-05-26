import 'package:flutter/material.dart';
import 'package:lokaverkefni/chance.dart';
import 'package:lokaverkefni/dice_screen.dart';
import 'package:lokaverkefni/four_of_a_kind.dart';
import 'package:lokaverkefni/full_house.dart';
import 'package:lokaverkefni/large_straight.dart';
import 'package:lokaverkefni/round_aces.dart';
import 'package:lokaverkefni/round_fives.dart';
import 'package:lokaverkefni/small_straight.dart';
import 'package:lokaverkefni/three_of_a_kind.dart';
import 'package:lokaverkefni/yahtzee.dart';
import 'package:lokaverkefni/yahtzee_list.dart';
import 'start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.greenAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ),
      home: Scaffold(body: StartScreen()),
    ),
  );
}

// takki 1 - venjulegt yahtzee, byrja á því
// takki 2 - 
// takki 3 - 