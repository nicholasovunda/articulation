import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  Color primaryColor = const Color(0xFF00A7E1);
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.08, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage("images/logo.png"),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text("Artic",
                      style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                          height: 1.0)),
                  Text(
                    "call",
                    style: GoogleFonts.poppins(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                        color: const Color(0xFF1B1B1E)),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "The all-in-one articulation \ntherapy tool",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: const ButtonWidget(text: "Start Free Trial", route: "/payment",),
                  ),
                  const SizedBox(height: 20.0,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child:TextButton(
                      style: TextButton.styleFrom(
                        shape:  RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF1B1B1E),),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context,"/loginpage", (route) => true);
                      },
                      child: Text("Sign In", style: GoogleFonts.inter(color: const Color(0xFF1B1B1E), fontWeight: FontWeight.w600, fontSize: 15),),
                    ),
                  ),
                  const SizedBox(height: 25.0,),
                  Text(
                    "Join articulation station and start using the new \nArticulation Station today.",
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                  const SizedBox(height: 10.0,),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Learn More', style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.red),),
                        const SizedBox(width: 2.0,),
                        const Icon(Icons.arrow_forward_ios, color: Colors.red,size: 14,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

class ButtonWidget extends StatefulWidget {
  final String text;
  final String route;
   const ButtonWidget({
    required this.text,
     required this.route,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),),
      ),
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context,widget.route, (route) => true);
      },
      child: Text(widget.text, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),),
    );
  }
}
