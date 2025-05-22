import 'package:flutter/material.dart';
import 'package:lokaverkefni/dice_screen.dart';
import 'package:lokaverkefni/yahtzee_list.dart';
import 'start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: YahtzeeList()),
    ),
  );
}

// takki 1 - venjulegt yahtzee, byrja á því
// takki 2 - 
// takki 3 - 