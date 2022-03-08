import 'package:articulation_studio/allscreens/components/itemslist/alphabet_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WordSelection extends StatefulWidget {
  final int position;
  bool onTap = false;
  WordSelection({
    required this.onTap,
    required this.position, Key? key}) : super(key: key);

  @override
  State<WordSelection> createState() => _WordSelectionState();
}

class _WordSelectionState extends State<WordSelection> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if (widget.onTap ==true){
            widget.onTap = false;
          }else{
            widget.onTap = true;
          }

        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(4, 8)
          )
          ],

          border: Border.all(
            color: Colors.black26,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          color: widget.onTap==false ? Colors.white : Colors.blue.shade400,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            dictionary.keys.elementAt(widget.position).toString(), style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
