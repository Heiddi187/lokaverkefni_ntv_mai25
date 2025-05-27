List<String> allCategories = [
  "Aces",
  "Twos",
  "Threes",
  "Fours",
  "Fives",
  "Sixes",
  "Three of a Kind",
  "Four of a Kind",
  "Full House",
  "Small Straight",
  "Large Straight",
  "Yahtzee",
  "Chance",
];

List<String> nameOfRound = [];
List<int> scoreOfRound = [];
Map<String, int> scoredPoints = {};
Set<String> usedCategories = {};

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
  scoredPoints.clear();
  usedCategories.clear();
}
