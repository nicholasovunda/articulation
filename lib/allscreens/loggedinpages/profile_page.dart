import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String name;
  final String urlImage;
  const UserProfile({
    Key? key,
    required this.urlImage,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black87),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: GestureDetector(
            onTap: (){ Navigator.pushNamedAndRemoveUntil(
                context, '/editProfile', (route) => true);},
            child: const Center(
              child: Text(
                "Edit",
                style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "Brand-Regular"),
              ),
            ),
          ),
        )
      ],
    ),
  );
}