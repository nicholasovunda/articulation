import 'package:articulation_studio/allscreens/components/itemslist/sentence_list.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/alphabet_provider.dart';
import '../../components/itemslist/alphabet_list.dart';
import '../image_container.dart';

class UniquePageSentence extends StatefulWidget {
  const UniquePageSentence ({Key? key}) : super(key: key);

  @override
  _UniquePageSentence  createState() => _UniquePageSentence ();
}

class _UniquePageSentence  extends State<UniquePageSentence > {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
// late PageController _pageController;

  PageController pageController = PageController();
  int pageNum = 0;
  @override
  Widget build(BuildContext context) {
    Map? newLow =
    Map.from(dictionary[Provider.of<AlphabetProvider>(context).word]);
    List newvalue = newLow[Provider.of<PositionProvider>(context).position];
    int extraindex = -2;
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
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.51,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (num) {
                    setState(() {
                      pageNum = num;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    extraindex += 2;
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.3,
                      // width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageContainer(
                            audioCache: audioCache,
                            thesize: false,
                            index: pageNum,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: newvalue.length,
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
