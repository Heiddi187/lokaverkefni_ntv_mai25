import 'package:flutter/material.dart';

List<String> nameOfRound = [];
List<int> scoreOfRound = [];

void addScoresToList(String round, int score) {
  int indexOf = nameOfRound.indexOf(round);
  if (indexOf >= 0) {
    scoreOfRound[indexOf] = score;
  } else {
    nameOfRound.add(round);
    scoreOfRound.add(score);
  }
}

int get totalScore {
  return scoreOfRound.fold(0, (sum, value) => sum + value);
}

void resetScores() {
  nameOfRound.clear();
  scoreOfRound.clear();
}
