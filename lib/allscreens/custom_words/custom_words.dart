import 'package:articulation_studio/AllScreens/components/add_word_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomWords extends StatefulWidget {
 ScrollController controller;

   CustomWords({
     required this.controller,
     Key? key}) : super(key: key);

  @override
  _CustomWordsState createState() => _CustomWordsState();
}

class _CustomWordsState extends State<CustomWords> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black54
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 40,
      title: const Text("Custom Words ", style: TextStyle(color:Colors.black54,fontSize: 20, fontWeight: FontWeight.w600 ) ),
    ),
    persistentFooterButtons: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BelowButton(text: "Add word",color: Colors.blue,textcolor: Colors.white,
          ),
            BelowButtonBack(),
          ],
        ),
      )
    ],
    body: ListView(
      // itemBuilder: ,
      controller: widget.controller,

    ),
  );
}

class BelowButtonBack extends StatelessWidget {
  const BelowButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),),
          ),
          child: Text("Done", style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: Colors.black45, fontSize: 15),),
          onPressed: (){
            Navigator.pop(context);
          }
      ),
    );
  }
}

// ignore: must_be_immutable
class BelowButton extends StatefulWidget {
  Color color;
  Color textcolor;
  String text;

   BelowButton({
     required this.color,
     required this.textcolor,
     required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<BelowButton> createState() => _BelowButtonState();
}

class _BelowButtonState extends State<BelowButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),),
        ),
        child: Text(widget.text, style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: widget.textcolor, fontSize: 15),),
        onPressed: (){
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            enableDrag: false,
            context: context,
            builder: (context) => buildFloatSheet(),
          );
        }
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

  Widget buildFloatSheet() => makeDismissible(
    child: DraggableScrollableSheet(
      maxChildSize: 1,
      initialChildSize: 0.9,
      minChildSize: 0.8,
      builder: (_, controller) => Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(15))),
          padding: const EdgeInsets.only(left: 10, top: 50, right: 10),
          child:AddWordWidget(controller: controller,),),
    ),
  );
}
