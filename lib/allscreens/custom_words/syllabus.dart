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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Text(
            widget.text!,
            style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}