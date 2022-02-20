import 'package:articulation_studio/AllScreens/components/column_circle_setting.dart';
import 'package:articulation_studio/AllScreens/custom_words/column_circle.dart';
import 'package:articulation_studio/AllScreens/components/custom_circle_about.dart';
import 'package:articulation_studio/AllScreens/components/row_factor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/itemslist/row_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color primaryColor = const Color(0xFF00A7E1);
  List<HomeRowWidget> newRow = HomeR.RowList();
  @override
  Widget build(BuildContext context) => Scaffold(
        // floating  app button on home page that returns a modalbuttomsheet
        floatingActionButton: FloatingActionButton(
          elevation: 4,
          child: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              enableDrag: false,
              context: context,
              builder: (context) => buildFloatSheet(),
            );
          },
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("images/logo.png"),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Artic",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                  height: 1.0)),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "call",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.1,
                                color: const Color(0xFF1B1B1E)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 60.0,
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 55.0,
                      color: Colors.blue.shade200,
                    )
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.separated(
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.00001,
                    ),
                    itemBuilder: (context, index) => HomeRowWidget(
                        firstMainText: newRow[index].firstMainText,
                        firstSubText: newRow[index].firstSubText,
                        secondMainText: newRow[index].secondMainText,
                        secondSubText: newRow[index].secondSubText),
                    itemCount: newRow.length,
                  ),
                ),
              )
            ],
          ),
        ),
      );
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
          maxChildSize: 0.5,
          initialChildSize: 0.3,
          minChildSize: 0.2,
          builder: (_, controller) => Container(
              decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              padding: const EdgeInsets.all(20),
              child: ListView(
                controller: controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ColumnCircle(
                          text: "Custom\n  Words",
                          context: context,
                          icon: Icons.maps_ugc,
                        ),
                        ColumnCircleAbout(
                          text: "About",
                          context: context,
                          icon: Icons.yard,
                        ),
                        ColumnCircleSettings(
                          text: "Settings",
                          context: context,
                          icon: Icons.settings_outlined,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      );
}
