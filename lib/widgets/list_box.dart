import 'package:flutter/material.dart';

class YahtzeeListBox extends StatelessWidget {
  const YahtzeeListBox({
    required this.roundTitle,
    required this.roundRules,
    required this.whichRound,
    super.key,
  });
  final String roundTitle;
  final String roundRules;
  final Widget whichRound;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 50,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 48,
              ), // sá í devTools að iconbutton er w:48, sett þetta inn til að fá texta í miðja miðju
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (ctx) => whichRound));
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      roundTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (ctx) => AlertDialog(
                          title: Text(
                            "Rules of $roundTitle",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: Text(roundRules),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                  );
                },
                icon: Icon(Icons.info, color: Colors.black),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(2)),
      ],
    );
  }
}
