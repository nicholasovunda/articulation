import 'package:articulation_studio/AllScreens/LoggedInPages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ColumnCircleSettings extends StatefulWidget {
  IconData icon;
  String text;
  ColumnCircleSettings({
    required this.text,
    required this.icon,
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  State<ColumnCircleSettings> createState() => _ColumnCircleSettingsState();
}

class _ColumnCircleSettingsState extends State<ColumnCircleSettings> {
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
          backgroundColor: Colors.red,
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

      initialChildSize: 0.9,


      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15),),),
        padding: const EdgeInsets.all(12),
        child: SettingsPage(controller: controller,),
      ),
    ),
  );
}
