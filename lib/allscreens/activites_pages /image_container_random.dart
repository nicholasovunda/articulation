import 'package:articulation_studio/allscreens/components/itemslist/alphabet_list.dart';
import 'package:articulation_studio/allscreens/components/itemslist/sentence_list.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

import '../../provider/alphabet_provider.dart';

// TODO fix this section for generating random images from the entire image

class ImageContainerRandom extends StatefulWidget {
  int keyindex;
  int index;
  bool thesize;
  bool sentence;
  ImageContainerRandom({
    required this.keyindex,
    required this.sentence,
    required this.thesize,
    required this.index,
    Key? key,
    required this.audioCache,
  }) : super(key: key);

  final AudioCache audioCache;

  @override
  State<ImageContainerRandom> createState() => _ImageContainerRandomState();
}

class _ImageContainerRandomState extends State<ImageContainerRandom> {
  @override
  Widget build(BuildContext context) {
    Map keys = dictionarySentence[Provider.of<AlphabetProvider>(context).word]
        [Provider.of<PositionProvider>(context).position];
    // var khiodj = keys.values.elementAt(widget.index);
    String index = keys.keys.toList()[8];
    String path = dictionary.keys
        .elementAt(8)[Provider.of<PositionProvider>(context).position][8].toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureImage(
          keyindex: 9,
          sentence: widget.sentence,
          index: 9,
          audioCache: widget.audioCache,
          size: widget.thesize,
        ),
        const SizedBox(
          height: 15.0,
        ),
        SizedBox(
          width: widget.sentence == true
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * 0.4,
          child: Center(
            child: Text(
              widget.sentence == true
                  ? dictionarySentence[
                                  Provider.of<AlphabetProvider>(context).word]
                              [Provider.of<PositionProvider>(context).position]
                          [index]
                      .toString()
             // ? "sentence"
                  : path,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}

class GestureImage extends StatefulWidget {
  final bool size;
  final int index;
  final bool sentence;
  final int keyindex;
  const GestureImage({
    required this.keyindex,
    required this.sentence,
    required this.index,
    required this.size,
    Key? key,
    required this.audioCache,
  }) : super(key: key);

  final AudioCache audioCache;

  @override
  State<GestureImage> createState() => _GestureImageState();
}

class _GestureImageState extends State<GestureImage> {
  @override
  Widget build(BuildContext context) {
    String thetext = dictionary.keys
        .elementAt(8)[Provider.of<PositionProvider>(context).position][8]
        .toString();

    String thelocal = dictionary.keys.elementAt(8).toString();
    var theposition = Provider.of<PositionProvider>(context).position;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.black26),
      child: GestureDetector(
        onTap: () async {
          await widget.audioCache.play("pie.mp4");
          print(dictionary.keys.elementAt(8));
        },
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            constraints: widget.size == true
                ? BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.47,
                    maxHeight: MediaQuery.of(context).size.height * 0.6)
                : null,
            width: widget.size == true
                ? MediaQuery.of(context).size.width * 0.47
                : MediaQuery.of(context).size.width * 0.9,
            height: widget.size == true
                ? MediaQuery.of(context).size.height * 0.2
                : MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              "images/"
              "${thelocal.toString()}"
              "/"
              "${theposition.toString()}"
              "/"
              "$thetext"
              ".png",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
