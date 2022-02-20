import 'dart:io';

import 'package:articulation_studio/AllScreens/custom_words/custom_words.dart';
import 'package:articulation_studio/AllScreens/components/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../custom_words/syllabus.dart';

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
                BelowButton(text: "Add word",color: Colors.blue,textcolor: Colors.white,
                ),
                const BelowButtonBack(),
              ],
            ),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView(
            controller: widget.controller,
            children: [
            image != null ? ImageWidget(image: image!, onClicked:(source) =>pickImage(source)): const Image(image:  AssetImage('images/logo.png',),height: 70, width: 70,),
              TextButton(onPressed: (){
               pickImage(ImageSource.gallery);
              }, child: const Text('Click')),
              CustomRow(
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
                text: "Enter word",
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomRow(
                text: "Enter word",
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text("Select Sound to save to:"),
            ],
          ),
        ),
      );
}


class CustomRow extends StatefulWidget {
  String? text;
  CustomRow({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.7,
          child:  TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                labelText: "Enter email address",
                labelStyle: GoogleFonts.inter(color: Colors.black54,fontWeight: FontWeight.w500, fontSize: 15),
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                )),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.05,
            child: const Icon(Icons.mic),
          ),
        )
      ],
    );
  }

}
