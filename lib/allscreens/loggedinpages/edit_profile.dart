import 'dart:ui';

import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}
// users editing their profile to add image and user name and email

class _EditProfileState extends State<EditProfile> {
  final fieldText = TextEditingController();
  final lastnameText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 80,
        leading:  Padding(
          padding:  const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context, '/userprofile');},
              child: const Text("Cancel", style: TextStyle(color: Colors.black,fontFamily: "Brand-Regular", fontSize: 16),)),
        ),
        title: const Padding(
          padding:  EdgeInsets.only(bottom: 5.0),
          child: Text("Edit Profile", style: TextStyle(color: Colors.black87, fontFamily: "Brand Bold", fontSize: 16),),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50,),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                radius: MediaQuery.of(context).size.width * 0.11,
                child: Icon(Icons.person,size: 45, color: Colors.grey.shade400,),
              ),
            ),
            const SizedBox(height: 20.0,),
            buildFormField(fieldText: fieldText, name: "First Name"),
            const SizedBox(height: 10.0,),
            buildFormField(fieldText: lastnameText, name: "Last Name"),
          ],
        ),
      ),
    );
  }
  Widget buildFormField({@required dynamic fieldText, @required String? name}) =>  Padding(
    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06, vertical: MediaQuery.of(context).size.height * 0.01),
    child:  TextField(
      controller: fieldText,
      selectionHeightStyle: BoxHeightStyle.tight,
      keyboardType: TextInputType.text,
      // textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: InputDecoration(
        focusedBorder:const OutlineInputBorder(borderSide: BorderSide(color: Colors.green),),
        fillColor: Colors.grey.shade200,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
        border:  const OutlineInputBorder(borderSide: BorderSide.none),
        focusColor: Colors.green,
        suffixIcon: IconButton(icon: const Icon(Icons.close),onPressed:() {fieldText.clear();}
        ),
        suffixIconColor: Colors.grey.shade200,
        // focusedBorder: InputBorder,
        labelText: name,
        labelStyle: const TextStyle(color: Colors.black45),
      ),
      style: const TextStyle(color: Colors.black87, fontFamily: "Brand-Regular",),
    ),
  );
}
