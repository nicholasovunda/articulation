import 'package:articulation_studio/allscreens/animations/sound_location.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AnimatedDirection extends StatefulWidget {
  final String? text;
  final String? subtext;
  final Color theColor;
  final IconData theIcon;
  final String theText;
  const AnimatedDirection(
      {
        this.subtext,
        this.text,
        required this.theColor,
        required this.theIcon,
        required this.theText,
        Key? key})
      : super(key: key);

  @override
  _AnimatedDirectionState createState() => _AnimatedDirectionState();
}

class _AnimatedDirectionState extends State<AnimatedDirection> {
  double? circleWidth = 160;
  double? circleHeight = 160;

  double? updateRadius() {
    setState(() {
      circleHeight = 155;
      circleWidth = 155;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
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
              padding: EdgeInsets.all(MediaQuery
                  .of(context)
                  .size
                  .width * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget.theIcon, size: 50, color: Colors.white70),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.01),
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
          onEnd: () =>
              setState(() {
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
        child: SoundLocation(controller: controller,text: text,subtext: subtext,theText: widget.theText,)
      ),
    ),
  );
}