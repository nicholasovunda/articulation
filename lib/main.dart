import 'package:articulation_studio/AllScreens/LoggedInPages/home_page.dart';
import 'package:articulation_studio/AllScreens/MainScreens/forgotpasswordpage.dart';
import 'package:articulation_studio/AllScreens/MainScreens/login_page.dart';
import 'package:articulation_studio/allscreens/activites_pages%20/words_pages%20/cards_page.dart';
import 'package:articulation_studio/allscreens/activites_pages%20/words_pages%20/pair_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AllScreens/MainScreens/payment_page.dart';
import 'AllScreens/MainScreens/signin.dart';
import 'allscreens/activites_pages /words_pages /matching_page.dart';
import 'package:provider/provider.dart';
import 'provider/alphabet_provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AlphabetProvider()),
          ChangeNotifierProvider(create:(_) => PositionProvider()),
      ],
      child: MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      textTheme: GoogleFonts.cabinTextTheme()
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SignUpScreen(),
        "/payment": (context) => const PaymentPage(),
        "/loginpage": (context) => const LoginPage(),
        "/forgotpassword": (context) => const ForgotPassword(),
        "/homepage": (context) => const HomePage(),
        "Matching": (context) => const MatchingPage(),
        "Cards": (context) => const CardsPage(),
        "Pairs": (context) => const PairPage(),
      },
    );
  }
}
