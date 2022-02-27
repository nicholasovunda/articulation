import 'dart:async';
import 'dart:math';

import 'package:articulation_studio/allscreens/activites_pages%20/image_container_random.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../provider/alphabet_provider.dart';
import '../../components/itemslist/alphabet_list.dart';
import '../image_container.dart';

class RotatingPagePhrase extends StatefulWidget {
  const RotatingPagePhrase({Key? key}) : super(key: key);

  @override
  _RotatingPagePhrase createState() => _RotatingPagePhrase();
}

class _RotatingPagePhrase extends State<RotatingPagePhrase> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
// late PageController _pageController;

  PageController pageController = PageController();
  int pageNum = 0;
  int pageValue = 0;
  int keyindex = 0;
  @override
  Widget build(BuildContext context) {
    Map? newLow =
        Map.from(dictionary[Provider.of<AlphabetProvider>(context).word]);
    List forValue = newLow[Provider.of<PositionProvider>(context,listen: false).position];
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(width: 0,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    height: 35,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  Provider.of<AlphabetProvider>(context).word,
                  style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 32.0,
                  width: 90.0,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "0/0",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "0%",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.51,
                child: Container(
                  margin: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lead word",
                            style: GoogleFonts.inter(
                                color: Colors.black38,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ImageContainerRandom(
                            keyindex: keyindex,
                            sentence: false,
                            audioCache: audioCache,
                            thesize: true,
                            index: pageValue,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              padding: const EdgeInsets.all(30),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {
                              setState(() {
                                int num = Random().nextInt(dictionary.keys.length - 1);
                                keyindex = num;
                                Timer(Duration(seconds: 1),() {
                                  List numbers = dictionary[keyindex][Provider.of<PositionProvider>(context, listen: false).position];
                                  int num2 = Random().nextInt(numbers.length - 1);
                                  pageValue = num2;
                                });
                              });
                            },
                            child: Text(
                              "Spin",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 2.0,
                        child: Divider(
                          color: Colors.black26,
                          thickness: 2.0,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Target word",
                            style: GoogleFonts.inter(
                                color: Colors.black38,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ImageContainer(

                            sentence: false,
                            audioCache: audioCache,
                            thesize: true,
                            index: pageNum,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              padding: const EdgeInsets.all(30),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {
                              setState(() {
                              pageNum = Random().nextInt(forValue.length - 1);
                              });
                            },
                            child: Text(
                              "Spin",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(13),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.check,
                    size: 40,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(13),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.water,
                    size: 40,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(13),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.close,
                    size: 40,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          backgroundColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.radio_button_checked,
                            color: Colors.red,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Record",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          backgroundColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            "Play",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
