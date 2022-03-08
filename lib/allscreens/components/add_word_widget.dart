import 'dart:io';

import 'package:articulation_studio/AllScreens/custom_words/custom_words.dart';
import 'package:articulation_studio/AllScreens/components/image_widget.dart';
import 'package:articulation_studio/allscreens/components/itemslist/alphabet_list.dart';
import 'package:articulation_studio/allscreens/components/wordselection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../custom_words/syllabus.dart';
import 'package:record/record.dart';

// this class stores custom words images and sentence by the users

class AddWordWidget extends StatefulWidget {
  ScrollController controller;
  AddWordWidget({required this.controller, Key? key}) : super(key: key);

  @override
  _AddWordWidgetState createState() => _AddWordWidgetState();
}

class _AddWordWidgetState extends State<AddWordWidget> {

  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      // final imageTemp = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

//TODO implement the audio player and record plugin
  ScrollController controller = ScrollController();
  TextEditingController wordController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();
  TextEditingController phraseController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    wordController.dispose();
    sentenceController.dispose();
    phraseController.dispose();
    // _audioplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        persistentFooterButtons: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BelowButton(
                  text: "Add word",
                  color: Colors.blue,
                  textcolor: Colors.white,
                ),
                const BelowButtonBack(),
              ],
            ),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              Column(
                // controller: widget.controller,d
                children: [
                  image != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                        clipBehavior: Clip.hardEdge,
                        child: ImageWidget(
                            image: image!,
                            onClicked: (source) => pickImage(source)),
                      )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                        child: const Image(
                            image: AssetImage(
                              'images/logo.png',
                            ),
                            height: 70,
                            width: 70,
                          ),
                      ),
                  TextButton(
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                      },
                      child: const Text('Add image')),
                  CustomRow(
                    controller: wordController,
                    text: "Enter word",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Syllabus:",
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                      Row(
                        children: [
                          SyllablesSelection(
                            text: "1",
                          ),
                          SyllablesSelection(text: "2"),
                          SyllablesSelection(text: "3"),
                          SyllablesSelection(text: "4+"),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomRow(
                    controller: sentenceController,
                    text: "Enter Sentence",
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomRow(
                    controller: phraseController,
                    text: "Enter phrase",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Select Sound to save to:",
                    style: GoogleFonts.inter(
                        fontSize: 15.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              GridView.count(
                  controller: controller,
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: List.generate(
                    dictionary.keys.length,
                    (index) => GestureDetector(
                      onTap: () => WordSelection(
                        position: index,
                        onTap: true,
                      ),
                      child: WordSelection(
                        position: index,
                        onTap: false,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 50,
              )
            ],
          ),

          // ListView.builder(itemBuilder:(content int))
        ),
      );
}

class CustomRow extends StatefulWidget {
  TextEditingController controller;

  String? text;
  CustomRow({
    required this.controller,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  final _audioplayer = Record();
  @override

  @override
  void dispose() {
    // TODO: implement dispose
    _audioplayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.75,
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                labelText: widget.text,
                labelStyle: GoogleFonts.inter(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
                // fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade400,
            radius: MediaQuery.of(context).size.width * 0.055,
            child: GestureDetector(
              onTap: () {
                setState(() async {
                  await _audioplayer.start(
                    path: "assets/newfile.m4a",
                    encoder: AudioEncoder.AAC,
                    bitRate: 128000,
                    samplingRate: 44100,
                  );
                });
              },
              // onTapCancel: ()async{
              //   await _audioplayer.stop();
              // },
              child: _audioplayer.start() == true ? Icon(
                Icons.mic,
                color: Colors.white,
              ) : Icon(
                Icons.add,color: Colors.red,
              )
            ),
          ),
        )
      ],
    );
  }
}
