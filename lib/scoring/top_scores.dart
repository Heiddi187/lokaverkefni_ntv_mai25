List<int> topScores = [];

void updateTopScores(int newScore) {
  if (topScores.length < 10) {
    topScores.add(newScore);
  } else {
    int lowestScore = topScores.reduce((a, b) => a < b ? a : b);
    if (newScore > lowestScore) {
      topScores.remove(lowestScore);
      topScores.add(newScore);
    }
  }
  topScores.sort((b, a) => a.compareTo(b));
}
