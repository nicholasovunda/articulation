import 'package:articulation_studio/allscreens/animations/animated_circle.dart';
import 'package:articulation_studio/allscreens/animations/animated_circle_sentence.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:articulation_studio/allscreens/animations/animated_circle_phrase.dart';
import 'package:provider/provider.dart';
import 'package:articulation_studio/provider/alphabet_provider.dart';

// This container contains the animated container for the home page, which contains letter and symbol for the sound inside the,
// we have the showmodalwidget(slideuppanel) for navigating to a particular section of the app based on the sound, and the values are,
// are passed down from the parent widget(this.container) it takes  an argument when called and passes down the value through the widget from the animated container
// to the slideuppanel.
class AnimationContainerWidget extends StatefulWidget {
  final String text;
  final String subText;

  const AnimationContainerWidget({
    required this.text,
    required this.subText,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimationContainerWidget> createState() =>
      _AnimationContainerWidgetState();
}

class _AnimationContainerWidgetState extends State<AnimationContainerWidget> {
  double? width = 150;
  double? height = 140;
var value = "";

  double? updateState() {
    setState(() {
      width = 145;
      height = 135;

    });
  }
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {setState(() {
        Provider.of<AlphabetProvider>(context, listen: false).AssignWord = widget.text;
      });
        updateState();
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          enableDrag: false,
          context: context,
          builder: (context) =>
              buildSheet(text: widget.text, subtext: widget.subText),
        );
        // Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false);
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 90,
                    maxWidth: 80,
                  ),
                  child: Text(
                    widget.text,
                    // widget.text,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800, fontSize: 60),
                  )),
              Text(
                widget.subText,
                style: GoogleFonts.nunito(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        width: width,
        height: height,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutBack,
        onEnd: () => setState(() {
          width = 150;
          height = 140;
        }),
      ),
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
  Widget buildSheet({required text, required subtext}) => makeDismissible(
        child: DraggableScrollableSheet(
          maxChildSize: 0.8,
          initialChildSize: 0.8,
          minChildSize: 0.7,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            padding: const EdgeInsets.all(20),
            child: ListView(
              controller: controller,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Row(
                      // textBaseline: TextBaseline.ideographic,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.close,
                            color: Colors.black38,
                            size: 32,
                          ),
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                              text: text,
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40,
                                  color: Colors.black38),
                              children: <TextSpan>[
                                TextSpan(
                                  text: subtext,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedCircleWords(
                      text: widget.text,
                      subtext: widget.subText,
                      theColor: Color(0xFF07393C),
                      theIcon: Icons.spa_outlined,
                      theText: "word",
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    AnimatedCirclePhrase(
                      text: widget.text,
                      subtext: widget.subText,
                      theColor: const Color(
                        0xFF007FFF,
                      ),
                      theText: "Phrases",
                      theIcon: Icons.light,
                    ),
                  ],
                ),
                AnimatedCircleSentence(
                    text: widget.text,
                    subtext: widget.subText,
                    theColor: const Color(0xFFC42021).withOpacity(1),
                    theIcon: Icons.emoji_nature_outlined,
                    theText: "Sentence"),
              ],
            ),
          ),
        ),
      );
}
