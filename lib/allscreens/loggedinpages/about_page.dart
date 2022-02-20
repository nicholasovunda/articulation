import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  ScrollController controller;
   AboutPage({
     required this.controller,
     Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    controller: widget.controller,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
              child: const Icon(Icons.close,color: Colors.black54,size: 25.0,)),
          SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
          Text('How to Use This App', style: GoogleFonts.inter(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16),)
        ],
      ),
      const SizedBox(height: 15.0,),
      Column(
        children: const [
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac venenatis purus, ut porta metus. Donec sollicitudin tellus a lectus iaculis scelerisque. Duis magna erat, cursus eu odio sed, tincidunt congue est. Suspendisse et nunc interdum, tristique eros vitae, vestibulum lectus. Proin mollis porttitor semper. Integer egestas sed leo dapibus ultrices. Fusce viverra urna tellus, vitae blandit mauris aliquet sed.",style: TextStyle(fontSize: 16),)
        ],
      )
    ],
  );
}
