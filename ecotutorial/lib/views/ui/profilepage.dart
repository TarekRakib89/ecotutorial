import 'package:ecotutorial/apppstyle.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is ProfilePage",
          style: appStyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
