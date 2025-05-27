import 'package:flutter/material.dart';
import 'package:lokaverkefni/rundown_rounds/chance.dart';
import 'package:lokaverkefni/rundown_rounds/four_of_a_kind.dart';
import 'package:lokaverkefni/rundown_rounds/full_house.dart';
import 'package:lokaverkefni/rundown_rounds/large_straight.dart';
import 'package:lokaverkefni/rundown_rounds/round_fives.dart';
import 'package:lokaverkefni/rundown_rounds/round_fours.dart';
import 'package:lokaverkefni/rundown_rounds/round_sixes.dart';
import 'package:lokaverkefni/rundown_rounds/round_threes.dart';
import 'package:lokaverkefni/rundown_rounds/round_twos.dart';
import 'package:lokaverkefni/rundown_rounds/small_straight.dart';
import 'package:lokaverkefni/rundown_rounds/three_of_a_kind.dart';
import 'package:lokaverkefni/rundown_rounds/yahtzee.dart';
import '../rundown_rounds/round_aces.dart';
import '../widgets/list_box.dart';

class YahtzeeList extends StatefulWidget {
  const YahtzeeList({super.key});

  @override
  State<YahtzeeList> createState() => _YahtzeeListState();
}

class _YahtzeeListState extends State<YahtzeeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Yahtzee",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 2 / 3,
              height: MediaQuery.of(context).size.height * 1 / 2,
              child: ListView(
                children: [
                  Text(
                    "Upper section",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Aces",
                    roundRules: "only counts 1's",
                    whichRound: RoundAces(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Twos",
                    roundRules: "only counts 2's",
                    whichRound: RoundTwos(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Threes",
                    roundRules: "only counts 3's",
                    whichRound: RoundThrees(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Fours",
                    roundRules: "only counts 4's",
                    whichRound: RoundFours(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Fives",
                    roundRules: "only counts 5's",
                    whichRound: RoundFives(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Sixes",
                    roundRules: "only counts 6's",
                    whichRound: RoundSixes(),
                  ),
                  Text(
                    "Lower section",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  YahtzeeListBox(
                    roundTitle: "3 of a kind",
                    roundRules:
                        "if you get three or more of the same number your score will be the total of all five dice \n( 5 + 5 + 5 + 1 + 2 = 18 )",
                    whichRound: ThreeOfaKind(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "4 of a kind",
                    roundRules:
                        "if you get four or more of the same number your score will be the total of all five dice\n( 5 + 5 + 5 + 5 + 2 = 22 )",
                    whichRound: FourOfaKind(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Full House",
                    roundRules:
                        "if you get three of one number and two of another you score 25 points, otherwise 0 \n( 1 + 1 + 1 + 2 + 2 = 25 )",
                    whichRound: FullHouse(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Small Straight",
                    roundRules:
                        "if you get a sequence of four numbers you score 30 points, otherwise 0 \n( 1 + 2 + 3 + 4 + any = 30 )\n( 2 + 3 + 4 + 5 + any = 30 )\n( 3 + 4 + 5 + 6 + any = 30 )",
                    whichRound: SmallStraight(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Large Straight",
                    roundRules:
                        "if you get a sequence of five numbers you score 40 points, otherwise 0 \n( 1 + 2 + 3 + 4 + 5 = 40 )\n( 2 + 3 + 4 + 5 + 6 = 40 )",
                    whichRound: LargeStraight(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Yahtzee",
                    roundRules:
                        "if you get five of the same number you score 50 points \n( 5 + 5 + 5 + 5 + 5 = 50 )",
                    whichRound: FullYahtzee(),
                  ),
                  YahtzeeListBox(
                    roundTitle: "Chance",
                    roundRules: "the total of all five dice",
                    whichRound: ChanceRound(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
