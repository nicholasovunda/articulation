import 'package:articulation_studio/allscreens/components/itemslist/alphabet_list.dart';
import 'package:articulation_studio/allscreens/components/itemslist/sentence_list.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

import '../../provider/alphabet_provider.dart';

class ImageContainer extends StatefulWidget {
  int index;
  bool thesize;
  ImageContainer({
    required this.thesize,
    required this.index,
    Key? key,
    required this.audioCache,
  }) : super(key: key);

  final AudioCache audioCache;

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {

  @override
  Widget build(BuildContext context) {
    Map keys = dictionarySentence[Provider.of<AlphabetProvider>(context).word][Provider.of<PositionProvider>(context).position];
    var khiodj = keys.values.elementAt(widget.index);
    var index  = keys.keys.toList()[widget.index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureImage(
          index: widget.index,
          audioCache: widget.audioCache,
          size: widget.thesize,
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
            child: Center(child: Text(dictionarySentence[Provider.of<AlphabetProvider>(context).word][Provider.of<PositionProvider>(context).position][index].toString()))),
      ],
    );
  }
}

class GestureImage extends StatefulWidget {
  final bool size;
  final int index;
  const GestureImage({
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
    String thetext = dictionary[Provider.of<AlphabetProvider>(context).word][Provider.of<PositionProvider>(context).position][widget.index].toString();
    var thelocal = Provider.of<AlphabetProvider>(context).word;
    var theposition = Provider.of<PositionProvider>(context).position;
    var path = "images/""${thelocal.toString()}""/""${theposition.toString()}""/""$thetext"".png";
    var path2 = "images/""${thelocal.toString()}""/""${theposition.toString()}""/""$thetext"".jpg";
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: GestureDetector(
        onTap: () async {
          await widget.audioCache.play("pie.mp4");
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          constraints: widget.size == true
              ? BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height * 0.6)
              : null,
          width: widget.size == true
              ? MediaQuery.of(context).size.width * 0.47
              : MediaQuery.of(context).size.width * 0.9,
          height: widget.size == true
              ? MediaQuery.of(context).size.height * 0.2
              : MediaQuery.of(context).size.height * 0.3,
          child:Image.asset(path == "images/""${thelocal.toString()}""/""${theposition.toString()}""/""$thetext"".png" ? path : path2,fit: BoxFit.cover,),
          ),
      ),
    );
  }
}

