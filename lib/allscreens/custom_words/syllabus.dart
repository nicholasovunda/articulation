import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SyllablesSelection extends StatefulWidget {
  String? text;
  SyllablesSelection({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<SyllablesSelection> createState() => _SyllablesSelectionState();
}

class _SyllablesSelectionState extends State<SyllablesSelection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          widget.text!,
          style: GoogleFonts.inter(fontSize: 12),
        ),
      ),
    );
  }
}