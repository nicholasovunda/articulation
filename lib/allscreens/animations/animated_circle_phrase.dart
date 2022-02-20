import 'package:articulation_studio/allscreens/animations/initial_page_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedCirclePhrase extends StatefulWidget {
  final String? text;
  final String? subtext;
  final Color theColor;
  final IconData theIcon;
  final String theText;
  const AnimatedCirclePhrase(
      {
        this.subtext,
        this.text,
        required this.theColor,
        required this.theIcon,
        required this.theText,
        Key? key})
      : super(key: key);

  @override
  _AnimatedCirclePhraseState createState() => _AnimatedCirclePhraseState();
}

class _AnimatedCirclePhraseState extends State<AnimatedCirclePhrase> {
  double? circleWidth = 160;
  double? circleHeight = 160;
// AnimationController _controller;
  double? updateRadius() {
    setState(() {
      circleHeight = 155;
      circleWidth = 155;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      updateRadius();
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        builder: (context) =>
            buildSheet(text: widget.text, subtext: widget.subtext),
      );
      // Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false)
    },
    child: AnimatedContainer(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.theIcon, size: 50, color: Colors.white70),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                widget.theText,
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.theColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ]),

      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutBack,
      height: circleHeight,
      width: circleWidth,
      onEnd: () => setState(() {
        circleHeight = 160;
        circleWidth = 160;
      }),
    ),
  );
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
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDirection(
                  theColor: widget.theColor,
                  theIcon: Icons.loop,
                  theText: "Rotating",
                  text: widget.text,
                  subtext: widget.subtext,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                AnimatedDirection(
                  theColor: widget.theColor,
                  theText: "Unique",
                  theIcon: Icons.star_outline,
                  text: widget.text,
                  subtext: widget.subtext,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
