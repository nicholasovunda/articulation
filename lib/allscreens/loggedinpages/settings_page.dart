import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  ScrollController controller;
   SettingsPage({
     required this.controller,
     Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text("Settings", style: GoogleFonts.inter(color: Colors.black54),),
      toolbarHeight: 40,
      iconTheme: const IconThemeData(
        color: Colors.black54
      ),
backgroundColor: Colors.transparent,
    elevation: 0,
    ),
    body: ListView(
      controller: widget.controller,
      children: [
        Container(
          height: 30,
          width: 30,
          color: Colors.black,
        )
      ],
    ),
  );
}
