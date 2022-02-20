import 'package:articulation_studio/AllScreens/custom_words/custom_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ColumnCircle extends StatefulWidget {
  IconData icon;
  String text;
  ColumnCircle({
    required this.text,
    required this.icon,
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  State<ColumnCircle> createState() => _ColumnCircleState();
}

class _ColumnCircleState extends State<ColumnCircle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          enableDrag: false,
          context: context,
          builder: (context) => buildFloatSheet(),
        );
      },
      child: Column(children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.1,
          backgroundColor: Colors.blue,
          child: Icon(
            widget.icon,
            size: 45,
            color: Colors.black12,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          widget.text,
          style: GoogleFonts.inter(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
        )
      ]),
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

  Widget buildFloatSheet() => makeDismissible(
        child: DraggableScrollableSheet(
          maxChildSize: 1,
          initialChildSize: 0.9,
          minChildSize: 0.7,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            padding: const EdgeInsets.all(20),
            child: CustomWords(controller: controller,),
          ),
        ),
      );
}
