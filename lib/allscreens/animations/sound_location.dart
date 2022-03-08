import 'package:articulation_studio/allscreens/components/itemslist/alphabet_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:articulation_studio/provider/alphabet_provider.dart';
import 'package:provider/provider.dart';

// the initial page before you select a section to play

class SoundLocation extends StatefulWidget {
  final ScrollController controller;
  final String text;
  final String subtext;
  final String theText;
  const SoundLocation(
      {required this.controller,
      required this.subtext,
      required this.text,
      required this.theText,
      Key? key})
      : super(key: key);

  @override
  _SoundLocationState createState() => _SoundLocationState();
}

class _SoundLocationState extends State<SoundLocation> {
  var keyList = dictionary.keys.toList();

  @override
  Widget build(BuildContext context) {
    Map? newLow = Map.from(dictionary[Provider.of<AlphabetProvider>(context).word]);
    return ListView(
      controller: widget.controller,
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    // print(newLow.keys.toList()[0]);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.black38,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                        text: widget.text,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            color: Colors.black38),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.subtext,
                            style: const TextStyle(
                                color: Colors.black38,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerNavigation(
              alphabet: Provider.of<AlphabetProvider>(context).word,
                theText: widget.theText,
                position:
                    dictionary[Provider.of<AlphabetProvider>(context).word]
                                ["initial"] ==
                            null
                        ? "null"
                        : "initial"),
            const SizedBox(width: 10,),
            ContainerNavigation(
              alphabet: Provider.of<AlphabetProvider>(context).word,
                theText: widget.theText,
                position:
                    dictionary[Provider.of<AlphabetProvider>(context).word]
                                ["median"] ==
                            null
                        ? "null"
                        : "median"),
            const SizedBox(width: 10,),
            ContainerNavigation(
              alphabet: Provider.of<AlphabetProvider>(context).word,
                theText: widget.theText,
                position:
                    dictionary[Provider.of<AlphabetProvider>(context).word]
                                ["final"] ==
                            null
                        ? "null"
                        : "final"),
          ],
        )
      ],
    );
  }
}

// for choosing either an initial median or final position
class ContainerNavigation extends StatelessWidget {
  final String alphabet;
  final String theText;
  final String position;
  const ContainerNavigation({
    required this.theText,
    required this.position,
    required this.alphabet,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (position != "null") {
      return GestureDetector(
        onTap: () {
          Provider.of<PositionProvider>(context, listen: false).AssignPosition = position;
          Navigator.pushNamedAndRemoveUntil(context, theText, (route) => true);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.28,
          height: MediaQuery.of(context).size.height * 0.052,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey.shade300),
          child: Center(
            child: Text(
              position,
              style: GoogleFonts.cabin(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade600),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox(
      );
    }
  }
}
