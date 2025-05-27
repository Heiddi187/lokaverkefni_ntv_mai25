List<int> fsDiceValue = [];

int fsScoreAces(List<int> dice) {
  int total = 0;
  for (int value in dice) {
    if (value == 1) {
      total += 1;
    }
  }
  return total;
}

int fsScoreTwos(List<int> dice) {
  int total = 0;
  for (int value in dice) {
    if (value == 2) {
      total += 2;
    }
  }
  return total;
}

int fsScoreThrees(List<int> dice) {
  int total = 0;
  for (int value in dice) {
    if (value == 3) {
      total += 3;
    }
  }
  return total;
}

int fsScoreFours(List<int> dice) {
  int total = 0;
  for (int value in dice) {
    if (value == 4) {
      total += 4;
    }
  }
  return total;
}

int fsScoreFives(List<int> dice) {
  int total = 0;
  for (int value in dice) {
    if (value == 5) {
      total += 5;
    }
  }
  return total;
}

int fsScoreSixes(List<int> dice) {
  int total = 0;
  for (int value in dice) {
    if (value == 6) {
      total += 6;
    }
  }
  return total;
}

int fsScoreThreeOfaKind(List<int> dice) {
  final counts = <int, int>{};
  for (var die in dice) {
    counts[die] = (counts[die] ?? 0) + 1;
  }
  if (counts.values.any((count) => count >= 3)) {
    return dice.reduce((a, b) => a + b);
  }
  return 0;
}

int fsScoreFourOfaKind(List<int> dice) {
  final counts = <int, int>{};
  for (var die in dice) {
    counts[die] = (counts[die] ?? 0) + 1;
  }
  if (counts.values.any((count) => count >= 4)) {
    return dice.reduce((a, b) => a + b);
  }
  return 0;
}

int fsScoreFullHouse(List<int> dice) {
  int total = 0;
  bool hasThree = false;
  bool hasTwo = false;
  for (int i = 1; i <= 6; i++) {
    int count = 0;
    for (int value in dice) {
      if (value == i) {
        count++;
      }
    }
    if (count == 3) {
      hasThree = true;
    } else if (count == 2) {
      hasTwo = true;
    }
  }
  if (hasThree && hasTwo) {
    total = 25;
  } else {
    total = 0;
  }
  return total;
}

int fsScoreSmallStraight(List<int> dice) {
  int total = 0;
  List<int> uniqueSorted = dice.toSet().toList()..sort();
  String values = uniqueSorted.join();
  if (values.contains("1234") ||
      values.contains("2345") ||
      values.contains("3456")) {
    total = 30;
  }
  return total;
}

int fsScoreLargeStraight(List<int> dice) {
  int total = 0;
  List<int> uniqueSorted = dice.toSet().toList()..sort();
  String values = uniqueSorted.join();
  if (values.contains("12345") || values.contains("23456")) {
    total = 40;
  }
  return total;
}

int fsScoreYahtzee(List<int> dice) {
  int total = 0;
  List<int> sorted = List.from(dice)..sort();
  String diceString = sorted.join();
  if (diceString.contains("11111") ||
      diceString.contains("22221") ||
      diceString.contains("33333") ||
      diceString.contains("44444") ||
      diceString.contains("55555") ||
      diceString.contains("66666")) {
    total = 50;
  }
  return total;
}

int fsScoreChance(List<int> dice) {
  int total = 0;
  for (var value in dice) {
    total += value;
  }
  return total;
}

int scoreChance(List<int> dice) => dice.reduce((a, b) => a + b);

final Map<String, int Function(List<int>)> scoringFunctions = {
  "Aces": fsScoreAces,
  "Twos": fsScoreTwos,
  "Threes": fsScoreThrees,
  "Fours": fsScoreFours,
  "Fives": fsScoreFives,
  "Sixes": fsScoreSixes,
  "Three of a Kind": fsScoreThreeOfaKind,
  "Four of a Kind": fsScoreFourOfaKind,
  "Full House": fsScoreFullHouse,
  "Small Straight": fsScoreSmallStraight,
  "Large Straight": fsScoreLargeStraight,
  "Yahtzee": fsScoreYahtzee,
  "Chance": fsScoreChance,
};
