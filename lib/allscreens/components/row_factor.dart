import 'package:flutter/material.dart';

import 'container.dart';

//TODO use a dictionary when refactoring code

class HomeRowWidget extends StatefulWidget {
  String firstMainText;
  String firstSubText;
  String secondMainText;
  String secondSubText;
  HomeRowWidget({
    required this.firstMainText,
    required this.firstSubText,
    required this.secondMainText,
    required this.secondSubText,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeRowWidget> createState() => _HomeRowWidgetState();
}

class _HomeRowWidgetState extends State<HomeRowWidget> {
  @override
  Widget build(BuildContext context) {
    return
       Padding(
         padding:  EdgeInsets.zero,
         child: SizedBox(
           width: MediaQuery.of(context).size.width * 0.9,
           height: MediaQuery.of(context).size.height * 0.2,
           child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimationContainerWidget(text: widget.firstMainText,subText: widget.firstSubText,),
              SizedBox(width: MediaQuery.of(context).size.width * 0.07 ,),
              AnimationContainerWidget(text: widget.secondMainText,subText: widget.secondSubText,),
            ],
      ),
         ),
       );

  }

}
