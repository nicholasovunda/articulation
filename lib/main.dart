import 'package:articulation_studio/AllScreens/LoggedInPages/home_page.dart';
import 'package:articulation_studio/AllScreens/MainScreens/forgotpasswordpage.dart';
import 'package:articulation_studio/AllScreens/MainScreens/login_page.dart';
import 'package:articulation_studio/allscreens/activites_pages%20/words_pages%20/cards_page.dart';
import 'package:articulation_studio/allscreens/activites_pages%20/words_pages%20/pair_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AllScreens/MainScreens/payment_page.dart';
import 'AllScreens/MainScreens/signin.dart';
import 'allscreens/activites_pages /phrases_pages/rotating_page.dart';
import 'allscreens/activites_pages /phrases_pages/unique_page.dart';
import 'allscreens/activites_pages /sentence_pages /rotating_mixed_page.dart';
import 'allscreens/activites_pages /sentence_pages /rotating_page.dart';
import 'allscreens/activites_pages /sentence_pages /unique_sentence_page.dart';
import 'allscreens/activites_pages /words_pages /matching_page.dart';
import 'package:provider/provider.dart';
import 'allscreens/loggedinpages/edit_profile.dart';
import 'allscreens/loggedinpages/profile_page.dart';
import 'allscreens/mainscreens/registration_page.dart';
import 'provider/alphabet_provider.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AlphabetProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PositionProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");
// TODO disposee animations and frame rate at thee start of the project

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, textTheme: GoogleFonts.cabinTextTheme()),
      initialRoute: "/",
      routes: {
        "/": (context) => const MainScreen(),
        "/signup": (context) => SignUpScreen(),
        "/registration": (context) => ResgistrationScreen(),
        "/payment": (context) => const PaymentPage(),
        "/loginpage": (context) => const LoginPage(),
        "/forgotpassword": (context) => const ForgotPassword(),
        "/homepage": (context) => const HomePage(),
        "Matching": (context) => const MatchingPage(),
        "Cards": (context) => const CardsPage(),
        "Pairs": (context) => const PairPage(),
        "Unique S": (context) => const UniquePageSentence(),
        "Rotate": (context) => const RotatingMixedSentence(),
        "Rolling": (context) => const RotatingPageSentence(),
        "Rotating": (context) => const RotatingPagePhrase(),
        "Unique": (context) => const UniquePagePhrase(),
        '/editProfile': (context) => const EditProfile(),
        '/userprofile': (context) => const UserProfile(name: "", urlImage: "",),
      },
    );
  }
}
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(child: CircularProgressIndicator(value: 8.0, color: Colors.green,));
          }
          else if(snapshot.hasError)
          {
            return const Center(child: Text("Something went wrong"));
          }
          else if (snapshot.hasData){
            return const HomePage();
          }
          else{
            return const LoginPage();
          }
        }
    ),
  );
}

