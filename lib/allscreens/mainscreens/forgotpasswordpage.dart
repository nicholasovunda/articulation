import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final email = TextEditingController();
  Color primaryColor = const Color(0xFF00A7E1);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 30,
      iconTheme: const IconThemeData(
        color: Colors.black87,
      ),
    ),
    body: SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10.0,),
            const Image(image: AssetImage("images/logo.png"),),
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
            const SizedBox(height: 10.0,),
            Text("Password reset", style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.black87),),
            const SizedBox(height: 8,),
            Text("Type your email address and we'll send you\n instructions for resetting your password", style: GoogleFonts.inter(fontWeight: FontWeight.w400, color: Colors.black54),),
            const SizedBox(height: 20.0,),
            SizedBox(
              height: 52,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: email,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    labelText: "Enter email address",
                    labelStyle: GoogleFonts.inter(color: Colors.black54,fontWeight: FontWeight.w500, fontSize: 15),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide.none
                    )
                ),
              ),
            ),
            const SizedBox(height: 15.0,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.75,
              child:TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),
                ),
                onPressed: () {},
                child: Text("Send Email", style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
