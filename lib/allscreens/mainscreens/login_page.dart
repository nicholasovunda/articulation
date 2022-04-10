import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
//TODO create the auth page using golang
class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  Color primaryColor = const Color(0xFF00A7E1);

  @override
  void dispose(){
    email.dispose();
    password.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      toolbarHeight: 30.0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const  IconThemeData(color: Colors.black87),
    ),
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02, horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                const Image(image: AssetImage("images/logo.png"),),
              const SizedBox(height: 30.0,),
              SizedBox(
                height: 53,
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
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                height: 53,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: password,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      labelText: "Password",
                      labelStyle: GoogleFonts.inter(color: Colors.black54,fontWeight: FontWeight.w500, fontSize: 15),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none
                      ),
                    suffixIcon: const Icon(Icons.visibility_off_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 10.0,),
              Padding(
                  padding:  EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Align(
                  alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context, "/forgotpassword", (route) => true);
                      },
                        child: Text("Forgot Password?", style: GoogleFonts.lato(fontWeight: FontWeight.w600, color: Colors.black87),)),),
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),),
                  ),
                  child: Text("Sign In", style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 15),),
                  onPressed: signIn,
                ),
              ),
              const SizedBox(height: 10.0,),
              Padding(
                padding:  EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context, "/registration", (route) => true);
                      },
                      child: Text("New User", style: GoogleFonts.lato(fontWeight: FontWeight.w600, color: Colors.black87),)),),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );
  }
}
